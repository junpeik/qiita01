class RemoveItemIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :item_id, :integer
  end
end
