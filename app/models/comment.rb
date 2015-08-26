class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: {message: " is required"},
                   uniqueness: {scope: :post_id}
end
