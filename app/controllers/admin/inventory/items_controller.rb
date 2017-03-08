class Admin::Inventory::ItemsController < Admin::SettingModuleController

  before_action :look_ups, :only => [:new, :edit, :update]
  before_action :set_item_id, :only=> [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("id DESC").paginate(:page => params[:items], :per_page => 10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/admin/inventory/items"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to "/admin/inventory/items?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to "/admin/inventory/items?update=success"
  end

  private

  def look_ups
    @category_types = CategoryType.select("id, name").order("name ASC").all
    @units = Unit.select("id, name").order("name ASC").all
	end

  def set_item_id
    @item = Item.find(params[:id])
  end

  def item_params
		params.require(:item).permit(:category_type_id, :item_code, :item_name, :description,
        :unit_id, :price, :sale_price, :stock)
	end

end
