class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :price

      t.references :product_info, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
