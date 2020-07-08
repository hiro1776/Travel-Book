class CreateTravelPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_posts do |t|

      t.timestamps
    end
  end
end
