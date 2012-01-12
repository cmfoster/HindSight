class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :career
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
