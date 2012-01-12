class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :story
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
