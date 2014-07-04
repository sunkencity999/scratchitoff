class AddListToPosts < ActiveRecord::Migration
  def change
    add_column :list_id
    add_index :list_id
  end
end
