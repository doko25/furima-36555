class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  
  with_options presence: true do
    validates :nickname
    validates :birth

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
      validates :name_last
      validates :name_first
    end

    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
      validates :name_kana_last
      validates :name_kana_first
    end
  end

  has_many :items
  has_many :buys
end