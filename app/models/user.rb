class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favourites, dependent: :destroy
  # has_many through
  # Has many of the posts, referenced through the Favourites table
  # Source is post (I guess this might be a class reference)
  has_many :favourite_posts, through: :favourites, source: :post

  validates :email, presence: {message: "must be present"},
                    uniqueness: true,
                    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  def user_name
    "#{first_name} #{last_name}"
  end

  def favourited_post?(post)
    favourite_posts.include?(post)
  end
end
