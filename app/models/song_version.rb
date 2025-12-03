class SongVersion < ApplicationRecord
  validates :song_name, :date, presence: true # these fields must not be blank
end
