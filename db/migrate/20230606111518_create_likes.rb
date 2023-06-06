class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true

      t.timestamps
    end
  end
end
