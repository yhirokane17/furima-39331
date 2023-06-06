class DocumentShippingAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :document, :number, :address_prefecture_id, :address_city, :address_number, :address_building, :telephone

  with_options presence: true do
    validates :document
    validates :number
    validates :address_city
    validates :address_number
    validates :telephone
  end
  validates :address_prefecture_id, presence: true, numericality:  { only_integer: true, greater_than: 1, message: "can't be blank" }

  def save
    document = Document.create(user_id: user_id,item: item)
    shipping_address.create(document: document, number: number, address_city: address_city, address_number: address_number, address_building: address_building, telephone: telephone, document_id: document.id)
  end
end
