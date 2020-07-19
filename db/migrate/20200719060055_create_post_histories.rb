class CreatePostHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_histories do |t|
    	t.integer :user_id, null: false
		  t.string :image_id
		  t.string :title, null: false
		  t.integer :price
		  t.text :body, null: false

      t.timestamps
    end
  end
end
