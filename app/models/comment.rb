class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: {message: "Comment body is required"},
                   uniqueness: {scope: :post_id}
end
