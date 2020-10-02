class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order =OrderSendPlace.new
    if user_signed_in? && current_user.id == @item.user.id
      return redirect_to root_path
    end
  end

  def create
    @order =OrderSendPlace.new(order_send_place_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def set_item
    @item =Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
 
  private
 
  def order_send_place_params
    params.permit(:token, :postalcode, :prefecture_id, :municipality, :homeadress, :building, :phonenumber).merge(user_id: current_user.id, : current_item.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_send_place_params[:token],
      currency:'jpy'
    )
  end
end