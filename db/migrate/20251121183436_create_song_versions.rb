class CreateSongVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :song_versions do |t|
      t.string :song_name
      t.string :date
      t.string :venue_name
      t.string :venue_location
      t.integer :vote_count
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
