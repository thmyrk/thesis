class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :completed
      t.belongs_to :sale

      t.timestamps null: false
    end
  end
end
