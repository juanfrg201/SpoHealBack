class CardiovascularDesease < ApplicationRecord
  has_many :user_parameterizations

  validates_uniqueness_of :name
end
