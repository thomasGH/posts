class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
	
	has_one :profile, dependent: :destroy

	has_many :posts, dependent: :destroy

	has_many :comments

	has_many :subscribers_posts, dependent: :destroy
  has_many :subscribed_posts, through: :subscribers_posts, source: :post

  def subscribe_to(post)
    subscribed_posts << post
  end
end
