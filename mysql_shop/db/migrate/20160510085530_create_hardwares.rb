class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|
      t.string :warranty
      t.string :purpose

      t.timestamps null: false
    end
  end
end
