class Admin::DashboardController < AdminController

  def index
    params[:q] ||= {}

    if params[:q][:created_at_lteq].present?
      params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
    end

    @q = Sale.ransack(params[:q])
    @sales = @q.result.all.page(params[:page])

    @total_sale = @sales.sum(:total)
  end

end
