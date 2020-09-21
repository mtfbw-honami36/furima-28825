class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user
      redirect_to root_path
    end
    if @item.purchaser_id.present?
      redirect_to root_path
    end
  end
  
  def create
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency:'jpy'
    )
  end

end