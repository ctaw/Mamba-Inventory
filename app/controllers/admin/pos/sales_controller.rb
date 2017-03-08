class Admin::Pos::SalesController < Admin::SettingModuleController

  before_action :look_ups, :only => [:new, :edit, :update]

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

  def computation
    item_id = params[:item_id]
    item = Item.select('id, item_name, price').where(id: item_id).first

    @item_price = item.price.to_f

    respond_to do |format|
      format.js { render :action => "computation" }
    end

  end

  private

  def look_ups
    @items = Item.select("id, item_name, unit_id").order("item_name ASC").all
    @units = Unit.select("id, name").order("name ASC").all
  end

  def sale_params
		params.require(:sale).permit(:transaction_code, :item_id, :note, :quantity, :price, :total)
	end

end
