class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :price
      t.belongs_to :staff, index: true

      t.timestamps null: false
    end
  end
end
