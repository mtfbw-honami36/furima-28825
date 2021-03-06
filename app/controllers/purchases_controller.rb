class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path 
    elsif @item.purchaser_id.present?
      redirect_to root_path
    end
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token, :item_id, :postalCode, :state_id, :city, :block_number, :building_name, :phoneNumber, :price).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
