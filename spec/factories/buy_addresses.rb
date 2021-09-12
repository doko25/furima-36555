FactoryBot.define do
  factory :buy_address do
    number      { '123-4567' }
    area_id     { 15 }
    town        { '横浜市' }
    banchi      { '青山1-1-1' }
    building    {}
    phone       { '09012345678' }
  end
end
