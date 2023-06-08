class DocumentShippingAddress
  include ActiveModel::Model
  attr_accessor :number, :address_prefecture_id, :address_city, :address_number, :address_building, :telephone,:user_id,:item_id, :token

  with_options presence: true do
    validates :number,format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :address_city
    validates :address_number
    validates :telephone,format: { with: /\A[0-9]{10,11}\z/}
    validates :item_id, :user_id
    validates :token

  end
  validates :address_prefecture_id, numericality:  { only_integer: true, greater_than: 1, message: "can't be blank" }

  def save
    document = Document.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(document_id: document.id, number: number, address_prefecture_id: address_prefecture_id,address_city: address_city, address_number: address_number, address_building: address_building, telephone: telephone)
  end
end