class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		current_user.subscribe_to(@post)
		redirect_to @post, notice: t('.subscribe')
	end

	def destroy
	end
end
