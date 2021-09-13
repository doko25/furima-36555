class BuyAddress
  include ActiveModel::Model
  attr_accessor :number,:area_id, :town, :banchi, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :town
    validates :banchi
    validates :user_id
    validates :item_id
    validates :number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :token

  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id )

    Address.create(number: number, area_id: area_id, town: town, banchi: banchi, building: building, phone: phone, buy_id: buy.id)
  end

end