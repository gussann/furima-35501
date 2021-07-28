class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  validates :nickname, :family_name, :family_name_kana, :first_name_kana, :birth_day, :first_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i }
  validates :encrypted_password, length: { minimum: 6 }
  validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :encrypted_password, confirmation: true
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }
  validates :family_name_kana, :first_name_kana, format: { with: /\p{katakana}/ }
  
end
