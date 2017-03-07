class Admin::SettingModule::CategoriesController < Admin::SettingModuleController

  before_action :look_ups, :only => [:new, :edit, :update]
  before_action :set_category_id, :only=> [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to "/admin/setting_module/"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to "/admin/setting_module?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to "/admin/setting_module?update=success"
  end

  private

  def look_ups
	end

  def set_category_id
    @category = Category.find(params[:id])
  end

  def category_params
		params.require(:category).permit(:name, :description)
	end

end
