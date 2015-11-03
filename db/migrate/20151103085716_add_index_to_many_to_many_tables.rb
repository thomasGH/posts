class AddIndexToManyToManyTables < ActiveRecord::Migration
  def change
  	add_index :categories_posts, :category_id
  	add_index :categories_posts, :post_id
  	add_index :tags_posts, :tag_id
  	add_index :tags_posts, :post_id
  end
end
