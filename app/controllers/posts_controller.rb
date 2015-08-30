class PostsController < ApplicationController
  before_action :post_params, only: [:create, :update]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
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
    current_post = Post.find(params[:id])
    unless params[:post][:favourite].nil?
      # It looks like params values must be strings to be written
      # correctly to the database. Normal boolean values don't work.
      # in DB, true is TrueClass, which converst to true
      # In DB, false is FalseClass, but has no value....
      if (current_post.favourite == true)
       params[:post][:favourite] = "false"
      else
       params[:post][:favourite] = "true"
      end
    end
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post updated!"
    else
      flash[:alert] = "See errors below:"
      render :edit
    end
  end
  def index
    @posts = Post.all.order(:id).page params[:page]
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit([:title,:body,:favourite])
  end
  def find_post
    @post = Post.find params[:id]
  end
end
