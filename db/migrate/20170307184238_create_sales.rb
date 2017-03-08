class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.string :item_code
      t.string :item_name
      t.text :note
      t.integer :quantity
      t.decimal :price
      t.decimal :total
      t.timestamps
    end
  end
end
