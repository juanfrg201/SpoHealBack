class CreateActivityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_types do |t|
      t.string :name
      t.string :description
      t.string :benefits

      t.timestamps
    end
  end
end
