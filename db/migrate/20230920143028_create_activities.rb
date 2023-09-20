class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :activity_type, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :tutorial
      t.string :benefits

      t.timestamps
    end
  end
end
