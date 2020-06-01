class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :localization
      t.integer :disponibity
      t.numeric :price
      t.string :categorie
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
