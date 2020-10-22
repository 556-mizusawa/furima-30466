class OrdersController < ApplicationController
  def index
    @customer_order = CustomerOrder.new
  end

  def create
    @customer_order = CustomerOrder.new(order_params)
    if @customer_order.valid?
      @customer_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:customer_order).permit(:postal_code, :prefecture_id, :city, :house_number, :tell_number).merge(token: params[:token])
  end
end
