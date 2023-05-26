FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    last_name             {'あ'}
    first_name            {'あ'}
    last_name_kana        {'ア'}
    first_name_kana       {'ア'}
    birthday              {'11111111'}
  end
end