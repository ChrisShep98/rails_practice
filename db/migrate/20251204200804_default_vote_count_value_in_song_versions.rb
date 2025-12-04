class DefaultVoteCountValueInSongVersions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :song_versions, :vote_count, from: nil, to: 1
    remove_column :song_versions, :slug, :string
  end
end
