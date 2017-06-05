class CreateKinships < ActiveRecord::Migration
  def change
    create_table :kinships do |t|
      t.belongs_to :person
      t.belongs_to :relative
      t.string :relationship_name

      t.timestamps null: false
    end
  end
end
