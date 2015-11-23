class SubscriptionsController < ApplicationController
	before_actions :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		current_user.subscribed_posts << @post
		redirect_to @post, notice: 'Вы успешно подписаны на обновления'
	end

	def destroy
	end
end
