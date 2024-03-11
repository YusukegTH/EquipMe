class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.boolean :availability
      t.text :adress
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
