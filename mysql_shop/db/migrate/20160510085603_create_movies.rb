class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :director
      t.string :genre
      t.string :age_requirements

      t.timestamps null: false
    end
  end
end
