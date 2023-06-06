class DocumentsController < ApplicationController
  def index
  end

  def  new
    @document_shipping_address = DocumentShippingAddress.new
  end

  def create
    @document_shipping_address = DocumentShippingAddress.new(document_params)
    if @document_shipping_address.valid?
      @document_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def document_params
    params.require(:document_shipping_address).permit(:document,:number,:address_prefecture_id,:address_city,:address_number,:address_building,:telephone)
  end
end
