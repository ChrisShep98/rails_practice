json.extract! song_version, :id, :song_name, :date, :venue_name, :venue_location, :vote_count, :voted_by_id, :comments_id, :user_who_posted_id, :description, :slug, :created_at, :updated_at
json.url song_version_url(song_version, format: :json)
