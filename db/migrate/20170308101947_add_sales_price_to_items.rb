class AddSalesPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_price, :decimal
  end
end
