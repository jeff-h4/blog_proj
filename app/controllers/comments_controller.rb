class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit,:show,:update,:destroy]
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_path(@comment), notice: "Comment created!"
    else
      flash[:alert] = "See errors below"
      render :new
    end

  end

  def update
    if @comment.update comment_params
      redirect_to comment_path(@comment), notice: "Comment updated!"
    else
      flash[:alert] = "Comment not updated. See errors below:"
      render :edit
    end
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  def index
    @comments = Comment.all
  end

  def show
  end

  private
  def find_comment
    @comment = Comment.find params[:id]
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
