class AddIdentifierToCardiovascularDesease < ActiveRecord::Migration[7.0]
  def change
    add_column :cardiovascular_deseases, :identifier, :integer
  end
end
