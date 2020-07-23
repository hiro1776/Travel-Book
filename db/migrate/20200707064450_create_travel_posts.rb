class CreateTravelPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_posts do |t|
      t.integer :user_id, null: false
      t.integer :tag_id
		  t.string :image_id
		  t.string :title, null: false
		  t.integer :price
		  t.text :body, null: false
      t.string :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
