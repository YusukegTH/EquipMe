class ChangeColumnNameAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :adress, :address
  end
end
