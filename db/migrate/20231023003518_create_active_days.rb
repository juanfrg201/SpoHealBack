class CreateActiveDays < ActiveRecord::Migration[7.0]
  def change
    create_table :active_days do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :day
      t.string :start_week
      t.string :end_week
      t.string :mensage

      t.timestamps
    end
  end
end
