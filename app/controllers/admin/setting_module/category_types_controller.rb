class Admin::SettingModule::CategoryTypesController < Admin::SettingModuleController

  before_action :look_ups, :only => [:new, :edit, :update]
  before_action :set_ct_id, :only=> [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @category_type = CategoryType.new
  end

  def create
    @category_type = CategoryType.new(ct_params)
    if @category_type.save
      redirect_to "/admin/setting_module/"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category_type.update(ct_params)
      redirect_to "/admin/setting_module?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @category_type.destroy
    redirect_to "/admin/setting_module?update=success"
  end

  private

  def look_ups
    @categories = Category.select("id, name").order("name ASC").all
	end

  def set_ct_id
    @category_type = CategoryType.find(params[:id])
  end

  def ct_params
		params.require(:category_type).permit(:category_id, :name, :description)
	end

end
