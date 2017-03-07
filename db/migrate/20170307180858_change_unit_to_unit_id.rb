class ChangeUnitToUnitId < ActiveRecord::Migration
  def change
    rename_column :items, :unit, :unit_id
  end
end
