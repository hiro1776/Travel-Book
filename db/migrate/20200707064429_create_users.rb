class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.integer :tag_id

      t.timestamps
    end
  end
end
