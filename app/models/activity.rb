class Activity < ApplicationRecord
  belongs_to :activity_type
  has_many :user_parameterizations

  validates_uniqueness_of :identifier
end
