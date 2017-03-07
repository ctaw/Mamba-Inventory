class Admin::SettingModuleController < AdminController

  def index
    @categories = Category.select("id, name, description").order("name ASC").paginate(:page => params[:categories], :per_page => 5)
    @category_types = CategoryType.select("id, category_id, name, description").order("name ASC").paginate(:page => params[:category_types], :per_page => 5)
    @units = Unit.select("id, name, description").order("name ASC").paginate(:page => params[:units], :per_page => 5)
  end

end
