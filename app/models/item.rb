class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :item, presence: true
  validates :explanation, presence: true
  validates :category_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_price_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :address_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true

end
