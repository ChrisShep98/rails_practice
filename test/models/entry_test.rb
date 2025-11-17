require "test_helper"

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "is valid with valid attributes" do
    entry = Entry.new(meal_type: "Dinner", carbohydrates: 50, proteins: 25, fats: 30, calories: 400)
    assert entry.save
  end
end
