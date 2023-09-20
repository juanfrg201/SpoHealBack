class AddIdentifierToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :identifier, :integer
  end
end
