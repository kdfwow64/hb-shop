class Admin::Reports::OverviewsController < Admin::Reports::BaseController
  helper_method :start_time, :end_time
  before_action :set_time_range

  def show
    @accounting_report  = hbEshopReports::Accounting.new(start_time, end_time)
    @orders_report      = hbEshopReports::Orders.new(start_time, end_time)
    @customers_report   = hbEshopReports::Customers.new(start_time, end_time)
    @final_number_of_cart_items     = CartItem.before(end_time).last   ? CartItem.before(end_time).last.id   : 0
    @beginning_number_of_cart_items = CartItem.before(start_time).last ? CartItem.before(start_time).last.id : 0
  end

end
