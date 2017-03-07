class AddTransactionCodeToSales < ActiveRecord::Migration
  def change
    add_column :sales, :transaction_code, :string
  end
end
