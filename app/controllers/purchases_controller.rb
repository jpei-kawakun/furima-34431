class PurchasesController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
    @items = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @items.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    @items = Item.find(params[:item_id])
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :phone_number, :building_name, :address).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
    amount: @items.price,
    card: purchase_params[:token],
    currency: 'jpy'
   )
  end

end
