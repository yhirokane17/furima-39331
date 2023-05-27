class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.all
  end

  def create
    Item create(item_params)
  end

 private
  def item_params
   params.require(:item).permit(:item,:explanation,:category_id,:status_id,:delivery_id,:address_prefecture_id,:delivery_date_id,:price)
  end
end