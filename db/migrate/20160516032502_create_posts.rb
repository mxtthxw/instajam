class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :artist
      t.string :city
      t.string :caption
      t.datetime :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
