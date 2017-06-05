class CreateProductsSales < ActiveRecord::Migration
  def change
    create_table :products_sales do |t|
      t.belongs_to :product, index: true
      t.belongs_to :sale, index: true

      t.timestamps null: false
    end
  end
end
