class CreatePostHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_histories do |t|

      t.timestamps
    end
  end
end
