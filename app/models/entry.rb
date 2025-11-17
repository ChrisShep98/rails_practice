class Entry < ApplicationRecord

  validates :calories, :proteins, :carbohydrates, :fats, :meal_type, presence: true # these fields must not be blank

  def day
    self.created_at.strftime("%b %e, %Y") #can refer to them model here as self. Could also use the class name Entry, will do same thing
  end
end
