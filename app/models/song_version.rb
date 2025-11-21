class SongVersion < ApplicationRecord
  belongs_to :voted_by
  belongs_to :comments
  belongs_to :user_who_posted
end
