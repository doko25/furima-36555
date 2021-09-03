FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a00000'}
    password_confirmation {password}
    name_last             {'山田'}
    name_first            {'太郎'}
    name_kana_last        {'ヤマダ'}
    name_kana_first       {'タロウ'}
    birth                 {'1997/05/25'}
  end
end
