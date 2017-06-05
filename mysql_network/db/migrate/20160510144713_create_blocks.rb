class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.belongs_to :blocker
      t.belongs_to :blocked

      t.timestamps null: false
    end
  end
end
