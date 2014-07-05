class AddListIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :list_id, :integer
    add_index :posts, :list_id 
  end
end
