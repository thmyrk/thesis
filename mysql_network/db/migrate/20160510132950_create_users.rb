class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :user_profile

      t.timestamps null: false
    end
  end
end
