class Delivery_price < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },   # ←こちらに注目しましょう
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' },
  ]

  validates :deliver_price_id, numericality: { other_than: 1 , message: "can't be blank"}
 
   include ActiveHash::Associations
   has_many :items
 
  end