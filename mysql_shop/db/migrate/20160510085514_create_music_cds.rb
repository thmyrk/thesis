class CreateMusicCds < ActiveRecord::Migration
  def change
    create_table :music_cds do |t|
      t.string :artist
      t.string :genre

      t.timestamps null: false
    end
  end
end
