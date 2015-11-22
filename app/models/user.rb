class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
	
	has_one :profile, dependent: :destroy

	has_many :posts, dependent: :destroy

	has_many :comments

	has_many :subscribers_posts
  has_many :posts, through: :subscribers_posts
end
