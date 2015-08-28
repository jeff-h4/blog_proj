class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true

  def user_name
    if user
      user.full_name
    else
      "Anonymous"
    end
  end
end
