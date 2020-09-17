class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user
      redirect_to root_path
    end
  end
  
  def create
  end
end
