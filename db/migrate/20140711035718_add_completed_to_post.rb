class AddCompletedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :completed, :boolean
  end
end
