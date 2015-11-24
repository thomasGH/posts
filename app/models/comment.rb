class Comment < ActiveRecord::Base
	belongs_to :post

	belongs_to :user

	validates :body, :post_id, presence: true

	after_save :send_notification

	after_save :distribution

	private

	def send_notification
		NotificationMailer.comment_notification(post.user, post, self).deliver_now
	end

	def distribution
	#	NotificationMailer.comment_distribution(post.users, post, self).deliver_now
	end
end
