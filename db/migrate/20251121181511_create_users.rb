class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :profile_picture
      t.references :posts, null: false, foreign_key: true
      t.references :posts_commented_on, null: false, foreign_key: true

      t.timestamps
    end
  end
end
