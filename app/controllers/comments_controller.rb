class CommentsController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        CommentsMailer.delay(run_at: 1.minutes.from_now).notify_post_owner(@comment)
        format.html { redirect_to post_path(@post), notice: "Comment created by " + current_user + "!"}
        format.js   { 
          #flash[:notice] = "Comment created by " + current_user + "!" 
          render :create
        }
      else
        flash[:alert] = "Comment not created! See errors below:"
        format.html { render "/posts/show" }
        format.js   { render js: " alert('Comment couldn't be saved!!!')"}
      end
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
