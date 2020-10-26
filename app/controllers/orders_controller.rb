class OrdersController < ApplicationController
  def index
    @customer_order = CustomerOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @customer_order = CustomerOrder.new(order_params)
    if @customer_order.valid?
      pay_item
      @customer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:customer_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tell_number, :token).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def item_params
    params.require(:item).permit(:title, :price).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
