class AddFavouriteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :favourite, :boolean, default: false
  end
end
