class Community < ApplicationRecord
  belongs_to :user
  has_many :community_posts
  has_one_attached :image
end
