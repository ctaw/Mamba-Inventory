class AddAndRemoveSalesCol < ActiveRecord::Migration
  def change
    remove_column :sales, :item_code
    remove_column :sales, :item_name
    add_column :sales, :unit_id, :integer
  end
end
