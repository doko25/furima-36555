class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :deliver_price_id
    validates :area_id
    validates :days_id
      validates :price, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  end
  
  with_options  numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :days_id
    validates :deliver_price_id
    validates :area_id
  end




  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliver_price
  belongs_to :area
  belongs_to :days
  belongs_to :user
  has_one_attached :image


end
