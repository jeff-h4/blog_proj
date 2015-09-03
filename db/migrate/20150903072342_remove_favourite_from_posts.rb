class RemoveFavouriteFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :favourite
  end
end
