FactoryBot.define do
  factory :purchase_destination do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678'}
    association :user
    association :item
  end
end
