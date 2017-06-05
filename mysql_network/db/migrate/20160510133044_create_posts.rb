class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.belongs_to :author, class_name: :User
      t.belongs_to :receiver, class_name: :User

      t.timestamps null: false
    end
  end
end
