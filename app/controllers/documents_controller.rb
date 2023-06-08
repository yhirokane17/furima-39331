class DocumentsController < ApplicationController
  before_action :move_to_root, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    #binding.pry
    @documentshippingaddress = DocumentShippingAddress.new
  end

  def create
    @documentshippingaddress = DocumentShippingAddress.new(documentshippingaddress_params)
    @item = Item.find(params[:item_id])
    #binding.pry
    if @documentshippingaddress.valid?
      pay_item
     @documentshippingaddress.save
      redirect_to root_path
    else
     @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def documentshippingaddress_params
    params.require(:document_shipping_address).permit(:number,:address_prefecture_id,:address_city,:address_number,:address_building,:telephone).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: documentshippingaddress_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end
  def move_to_root
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
