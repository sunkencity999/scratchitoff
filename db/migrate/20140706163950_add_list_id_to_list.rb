class AddListIdToList < ActiveRecord::Migration
  def change
    add_column :lists, :list_id, :integer
    add_index :lists, :list_id
  end
end
