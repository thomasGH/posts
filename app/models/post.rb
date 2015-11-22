class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  has_many :categories_posts, dependent: :destroy
  has_many :categories, through: :categories_posts

  has_many :tags_posts
  has_many :tags, through: :tags_posts

  has_many :subscribers_posts
  has_many :users, through: :subscribers_posts

  belongs_to :user

  validates :title, :body, presence: true

  scope :reverse_order, ->(order) { order(created_at: order) }
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
end
