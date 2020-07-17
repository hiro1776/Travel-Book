class CreateTravelPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_posts do |t|
      t.integer :user_id, null: false
		  t.text :travel_image_url
		  t.string :title, null: false
		  t.integer :price
		  t.text :body, null: false

      t.timestamps
    end
  end
end
