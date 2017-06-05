class AddUsersReferenceToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true, null: false
  end
end
