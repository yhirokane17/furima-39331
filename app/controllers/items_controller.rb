class ItemsController < ApplicationController

  def index
    @items = Item.all
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

 private
  def item_params
   params.require(:item).permit(:item,:explanation,:category_id,:status_id,:delivery_price_id,:address_prefecture_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end
end