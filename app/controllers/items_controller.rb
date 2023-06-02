class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit,:update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

   if @item.save
    redirect_to items_path
   else
    render :new
   end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
  end
end
  def destroy
    @item.destroy
    redirect_to items_path
  end

 private
  def item_params
   params.require(:item).permit(:item,:explanation,:category_id,:status_id,:delivery_price_id,:address_prefecture_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end