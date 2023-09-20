class UserParameterization < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :cardiovascular_desease
end
