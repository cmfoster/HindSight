class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end
end