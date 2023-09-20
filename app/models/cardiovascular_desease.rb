class CardiovascularDesease < ApplicationRecord
  has_many :user_parameterizations

  validates_uniqueness_of :identifier
end
