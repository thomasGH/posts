class SubscribersPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validate :user_id, :post_id, presence: true
end