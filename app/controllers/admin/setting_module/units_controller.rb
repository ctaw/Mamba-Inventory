class Admin::SettingModule::UnitsController < Admin::SettingModuleController

  before_action :look_ups, :only => [:new, :edit, :update]
  before_action :set_unit_id, :only=> [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      redirect_to "/admin/setting_module/"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @unit.update(unit_params)
      redirect_to "/admin/setting_module?update=updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @unit.destroy
    redirect_to "/admin/setting_module?update=success"
  end

  private

  def look_ups
	end

  def set_unit_id
    @unit = Unit.find(params[:id])
  end

  def unit_params
		params.require(:unit).permit(:name, :description)
	end

end
