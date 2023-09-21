class AddInensityAndDurationToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :intensity, :integer
    add_column :activities, :duration, :integer
  end
end
