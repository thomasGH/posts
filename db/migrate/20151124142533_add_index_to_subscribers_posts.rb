class AddIndexToSubscribersPosts < ActiveRecord::Migration
  def change
    add_index :subscribers_posts, :user_id
    add_index :subscribers_posts, :post_id
  end
end
