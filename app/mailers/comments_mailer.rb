class CommentsMailer < ApplicationMailer
  def notify_post_owner(comment)
    @comment   = comment
    @post      = comment.post
    @post_user = @post.user
    mail(to: @post_user.email, subject: "Somebody commented on your post!")
  end
end
