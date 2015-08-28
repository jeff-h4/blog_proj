class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :body, presence: {message: " is required"},
                   uniqueness: {scope: :post_id}
  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end
end
