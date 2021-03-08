class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_destination = PurchaseDestination.new
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
  end

private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :phone_number, :building_name, :address).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
   )
  end

  def set_item
    @item = Item.find(params[:item_id])
   end

   def sold_out_item
    redirect_to root_path if @item.purchase.present?
   end

   def move_to_index
    if current_user.id == @items.user_id
      redirect_to root_path
    end
   end

end
