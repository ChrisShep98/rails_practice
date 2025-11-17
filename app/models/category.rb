class Category < ApplicationRecord
  has_many :entries # One category can have many entries
end
