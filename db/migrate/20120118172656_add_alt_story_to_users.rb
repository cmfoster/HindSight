class AddAltStoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alt_story, :text
  end
end
