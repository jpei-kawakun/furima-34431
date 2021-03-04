class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]

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
    if current_user.id == @item.user_id
      redirect_to edit_item_path
     else 
       redirect_to root_path
     end
  end

  def update
    if current_user.id != @item.user_id
      redirect_to root_path
    end
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

   def item_params
     params.require(:item).permit(:image,:name,:description,:category_id,:prefecture_id,:shipping_cost_id,:shipping_day_id,:status_id,:price).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end

  

end


