class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :address_prefecture
  belongs_to :category
  belongs_to :delivery_date
  belongs_to :delivery_price
  belongs_to :status
  has_one_attached :image

  validates :item, presence: true
  validates :explanation, presence: true
  validates :category_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id , presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_price_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :address_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_date_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A\d+\z/, message: "is invalid" }
  validates :image, presence: true

end