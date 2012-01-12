class CreateHinds < ActiveRecord::Migration
  def change
    create_table :hinds do |t|
      t.string :subject
      t.integer :post_id

      t.timestamps
    end
  end
end
