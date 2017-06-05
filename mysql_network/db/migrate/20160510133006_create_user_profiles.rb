class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.datetime :date_of_birth

      t.timestamps null: false
    end
  end
end
