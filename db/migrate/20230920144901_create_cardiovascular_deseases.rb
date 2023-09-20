class CreateCardiovascularDeseases < ActiveRecord::Migration[7.0]
  def change
    create_table :cardiovascular_deseases do |t|
      t.string :name
      t.string :description
      t.integer :risk

      t.timestamps
    end
  end
end
