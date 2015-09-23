class Tag < ActiveRecord::Base
  has_many :post_tag_links, dependent: :destroy
  has_many :posts, through: :post_tag_links
end
