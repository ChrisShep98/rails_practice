class ReferenceAddToSongVersionsTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :song_versions, :user, null: false, foreign_key: true
  end
end
