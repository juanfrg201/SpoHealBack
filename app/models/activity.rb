class Activity < ApplicationRecord
  belongs_to :activity_type
  has_many :user_parameterizations
  has_many :activity_recommendations

  validates_uniqueness_of :identifier

  enum intensity: {
    "Baja" => 0,
    "Media" => 1,
    "Alta" => 2
  }
  
end
