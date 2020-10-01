class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index, :show]

  def index
    @items= Item.all.order(created_at: :desc)
  end

  def new
    @item =Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item =Item.find(params[:id])
  end

  def move_to_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :explanatory, :price, :category_id, :status_id, :fee_id, :shipmentsource_id, :timerequired_id).merge(user_id: current_user.id)
  end
end
