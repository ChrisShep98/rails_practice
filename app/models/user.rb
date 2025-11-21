class User < ApplicationRecord
  belongs_to :posts
  belongs_to :posts_commented_on
end
