FactoryBot.define do
  factory :document_shipping_address do
    number { '123-4567' }
    address_prefecture_id { 3 }
    address_city { '青森市' }
    address_number { '1-1' }
    address_building { '青森ハイツ' }
    telephone { '09011111111' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
