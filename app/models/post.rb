class Post < ActiveRecord::Base
	has_many :comments
	has_many :categories_posts
	has_many :categories, through: :categories_posts
	has_many :tags_posts
	has_many :tags, through: :tags_posts

	validates :title, :body, presence: true
end
