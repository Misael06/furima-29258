class OrdersController < ApplicationController
  before_action :move_to_new, only: [:index]

  def index
    @item=Item.find(params[:item_id])
  end
 
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def move_to_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
 
  private
 
  def order_params
    params.require(:order).permit(:token).merge(user_id: current_user.id, item_id: current_item.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end