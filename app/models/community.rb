class Community < ApplicationRecord
  belongs_to :user

  validates_uniqueness_of :identifier

end
