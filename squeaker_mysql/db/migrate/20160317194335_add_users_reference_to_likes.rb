class AddUsersReferenceToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :user, index: true, null: false
  end
end
