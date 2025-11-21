json.extract! user, :id, :username, :email, :password, :profile_picture, :posts_id, :posts_commented_on_id, :created_at, :updated_at
json.url user_url(user, format: :json)
