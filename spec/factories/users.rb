FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'a00000'}
    password_confirmation {password}
    last_name             {'あいう'}
    first_name            {'あいう'}
    last_name_kana        {'ア'}
    first_name_kana       {'ア'}
    birthday              {'11111111'}
  end
end