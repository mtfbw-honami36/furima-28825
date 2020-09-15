class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @genre = Genre.find(@item.genre_id)
    @item_condition = ItemCondition.find(@item.item_condition_id)
    @shipping_cost = ShippingCost.find(@item.shipping_cost_id)
    @ship_from = ShipFrom.find(@item.ship_from_id)
    @delivery_day = DeliveryDay.find(@item.delivery_day_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :genre_id, :item_condition_id, :shipping_cost_id, :ship_from_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
