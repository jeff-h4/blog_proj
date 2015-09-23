class FavouritesController < ApplicationController
  before_action :authenticate_user!
  def create
    #f       = Favourite.new
    #f.user  = current_user
    post = Post.find params[:post_id]
    favourite  = Favourite.new(post: post, user: current_user)
    if favourite.save
      redirect_to post, notice: "Favourited!"
    else
      redirect_to post, alert: "Unable to Favourite!"
    end
  end
  def destroy
    favourite = Favourite.find params[:id]
    post = Post.find params[:post_id]
    favourite.destroy
    redirect_to post, notice: "Un-favourited!"
  end
end
