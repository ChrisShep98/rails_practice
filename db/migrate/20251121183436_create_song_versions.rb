class CreateSongVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :song_versions do |t|
      t.string :song_name
      t.string :date
      t.string :venue_name
      t.string :venue_location
      t.integer :vote_count
      t.references :voted_by, foreign_key: true
      t.references :comments , foreign_key: true
      t.references :user_who_posted, null: false, foreign_key: true
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
