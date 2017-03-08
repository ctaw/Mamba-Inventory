class RemoveUnitIdToSale < ActiveRecord::Migration
  def change
    remove_column :sales, :unit_id
  end
end
