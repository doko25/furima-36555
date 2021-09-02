class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :nickname, presence: true
  validates :name_last, presence: true
  validates :name_first, presence: true
  validates :name_kana_last, presence: true
  validates :name_kana_first, presence: true
  validates :birth, presence: true
end
