class CommentsController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new comment_params
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: "Comment created!"
    else
      flash[:alert] = "Comment not created! See errors below:"
      render "/posts/show"
    end

  end

  def destroy
    @comment = Comment.find params[:id]
    @post = Post.find params[:post_id]
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment deleted."
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
