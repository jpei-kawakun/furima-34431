class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @purchase_destination = PurchaseDestination.new
    if user_signed_in? && current_user.id == @items.user_id
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end

    if current_user.id == @items.user_id
      redirect_to root_path
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

  def set_item
    @item = Item.find(params[:id])
   end

   def sold_out_item
    redirect_to root_path if @item.purchase.present?
   end

end