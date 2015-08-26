class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:title,:body])
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "Post created!"
    else
      flash[:alert] = "See errors below:"
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    post_params = params.require(:post).permit([:title,:body])
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post updated!"
    else
      flash[:alert] = "See errors below:"
      render :edit
    end
  end
  def index
    @posts = Post.all
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private
  def find_post
    @post = Post.find params[:id]
  end
end
