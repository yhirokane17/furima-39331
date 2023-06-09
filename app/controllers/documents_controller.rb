class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only:[:index, :create, ]
  before_action :move_to_root, only: [:index]

  def index
    @documentshippingaddress = DocumentShippingAddress.new
  end

  def create
    @documentshippingaddress = DocumentShippingAddress.new(documentshippingaddress_params)
    if @documentshippingaddress.valid?
      pay_item
     @documentshippingaddress.save
      redirect_to root_path
    else
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
    set_item
    @document = Document.find_by(item_id: @item.id)
    if @item.user_id == current_user.id || !(@document.nil?)
      redirect_to root_path
    end
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
