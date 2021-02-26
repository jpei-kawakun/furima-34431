FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'1aA' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'タロウ'}
    birth_day {'1930-01-10'}
  end
end
