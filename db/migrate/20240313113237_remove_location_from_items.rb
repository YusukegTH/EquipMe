class RemoveLocationFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :location, :string
  end
end
