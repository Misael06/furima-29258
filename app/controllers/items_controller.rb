class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
    @items =Item.all
  end

  def new
    @item =Item.new
  end

  def create
    @item =Item.create(item_params)
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.valid?
      item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  #商品削除で確認
  def destroy
  end
  #/商品削除で再度確認

  def move_to_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :explanatory, :price, :category, :status, :fee, :shipmentsource, :timerequired).merge(user_id: current_user.id)
  end
end
