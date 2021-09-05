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
    validates :price
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
