class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  validates :title, presence: true, uniqueness: true
  paginates_per 10

  def user_name
    if user
      user.user_name
    else
      "Anonymous"
    end
  end

  def self.search(item)
    search_term = "%#{item}%"
    where(["title ILIKE :term OR body ILIKE :term",term: search_term])
  end

  def self.search_multiple(words)
    query = []
    terms = []
    words.split.each do |word|
      search_term = "%#{word}%"
      terms << search_term
      terms << search_term
      query << "title ILIKE ? OR body ILIKE ?"
    end
    where([query.join( " OR ")] + terms)
  end
end
