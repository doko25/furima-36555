FactoryBot.define do
  factory :item do
    name              { 'test' }
    detail            { 'testdetail' }
    category_id       { 2 }
    condition_id      { 2 }
    deliver_price_id  { 2 }
    area_id           { 2 }
    days_id           { 2 }
    price             { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
