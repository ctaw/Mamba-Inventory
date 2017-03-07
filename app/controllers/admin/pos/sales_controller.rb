class Admin::Pos::SalesController < Admin::SettingModuleController

  def index
    @transactions = Sale.all.order("id DESC").paginate(:page => params[:transactions], :per_page => 10)
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      
      # Update Stock in Inventory {items table}
      @quantity = @sale.quantity

      @item = Item.find(@sale.item_id)
      @updated_stock = (@item.stock.to_i - @quantity.to_i)

      @item.update_attributes(:stock => @updated_stock.to_i)

      redirect_to "/admin/pos/sales"
    else
      render :new
    end
  end

  private

  def sale_params
		params.require(:sale).permit(:transaction_code, :item_id, :item_code, :item_name, :note, :quantity, :price, :total)
	end

end
