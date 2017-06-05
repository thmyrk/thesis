class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.belongs_to :user
      t.belongs_to :interest

      t.timestamps null: false
    end
  end
end
