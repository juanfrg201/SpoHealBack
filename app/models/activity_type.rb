class ActivityType < ApplicationRecord
    has_one_attached :imagen
    has_many :activities

    validates_uniqueness_of :name
end
