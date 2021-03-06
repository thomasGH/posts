class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		current_user.subscribe_to(@post)
		redirect_to @post, notice: t('.subscribe')
	end

	def destroy
    subscription = SubscribersPost.find_by_post_id(params[:id])
    subscription.destroy if current_user.id == subscription.user_id
    redirect_to subscription.post, notice: t('.unsubscribe')
	end
end
