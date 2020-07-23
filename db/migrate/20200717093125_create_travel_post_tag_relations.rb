class CreateTravelPostTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_post_tag_relations do |t|
      t.references :travel_post, foreign_key: true
      t.references :tag, foreign_key: true

      t.integer :tag_id
      t.integer :travel_post_id

      t.timestamps
    end
  end
end
