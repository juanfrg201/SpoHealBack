class CreateUserRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_routes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
