class AddCategoryReferenceToEntries < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :category, null: false, foreign_key: true
    #             ^ table   ^ column  ^cant be null ^ adds foreign key constraint             
  end
end



