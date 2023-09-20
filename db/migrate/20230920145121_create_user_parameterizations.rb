class CreateUserParameterizations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_parameterizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.references :cardiovascular_desease, null: false, foreign_key: true
      t.integer :age
      t.float :weight
      t.integer :height
      t.float :imc

      t.timestamps
    end
  end
end
