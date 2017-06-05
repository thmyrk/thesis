class CreateVideoGames < ActiveRecord::Migration
  def change
    create_table :video_games do |t|
      t.string :genre
      t.string :age_requirements

      t.timestamps null: false
    end
  end
end
