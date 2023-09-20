class Activity < ApplicationRecord
  belongs_to :activity_type
  has_many :user_parameterizations
end
