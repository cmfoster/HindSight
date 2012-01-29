class AddSolutionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :solution, :text
  end
end
