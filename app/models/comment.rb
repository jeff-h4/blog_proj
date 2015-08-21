class Comment < ActiveRecord::Base
  # Uniqueness supposed to be limited to the blog post.
  # this might need a change later
  validates :body, presence: true, uniqueness: true
end
