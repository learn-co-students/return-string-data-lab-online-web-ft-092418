class RemoveInventoryFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :inventory, :boolean
  end
end
