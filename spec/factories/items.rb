FactoryBot.define do
  factory :item do
    name              { 'test' }
    detail            { 'testdetail' }
    category_id       { 'メンズ' }
    condition_id      { '新品・未使用' }
    deliver_price_id  { '着払い(購入者負担)' }
    area_id           { '北海道' }
    days_id           { '4~7日で発送' }
    price             { '500' }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
