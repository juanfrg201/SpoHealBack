class UserParameterization < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :cardiovascular_desease


  def calculate_imc
    height_m = self.height / 100
    self.weight / height_m * height_m
  end
end
