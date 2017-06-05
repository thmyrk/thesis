class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.belongs_to :person
      t.belongs_to :partner
      t.datetime :anniversary_date

      t.timestamps null: false
    end
  end
end
