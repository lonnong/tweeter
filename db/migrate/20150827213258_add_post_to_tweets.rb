class AddPostToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :post, :boolean
  end
end
