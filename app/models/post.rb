class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  paginates_per 10

  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end
end
