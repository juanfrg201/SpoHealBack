class AddNumerPhoneToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :number_phone, :string
  end
end
