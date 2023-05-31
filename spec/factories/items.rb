FactoryBot.define do
  factory :item do
    item { 'a' }
    explanation { Faker::Lorem.paragraph }
    category_id { 2 }
    status_id  { 2 }
    delivery_price_id { 2 }
    address_prefecture_id { 2 }
    delivery_date_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
