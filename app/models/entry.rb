class Entry < ApplicationRecord

  belongs_to :category
  validates :calories, :proteins, :carbohydrates, :fats, :meal_type, :category_id, presence: true # these fields must not be blank

  def day
    self.created_at.strftime("%b %e, %Y") #can refer to them model here as self. Could also use the class name Entry, will do same thing
  end
end
