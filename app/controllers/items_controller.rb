class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new (item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

   def item_params
     params.require(:item).permit(:image,:name,:description,:category_id,:prefecture_id,:shipping_cost_id,:shipping_day_id,:status_id,:price).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end

   def move_to_index
    if current_user.id != @item.user_id
      redirect_to root_path
    end
   end

   def sold_out_item
    if @item.purchase.present?
      redirect_to root_path
    end
   end

  

end


