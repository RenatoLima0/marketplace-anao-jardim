class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :localization
      t.integer :disponibility
      t.numeric :price
      t.string :category
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
