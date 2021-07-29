class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  validates :nickname, :family_name, :family_name_kana, :first_name_kana, :birth_day, :first_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i
  validates :encrypted_password, length: { minimum: 6 }
  validates_format_of :encrypted_password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :encrypted_password, confirmation: true
  validates_format_of :family_name, :first_name, with: /\A[ぁ-んァ-ン一-龥]/
  validates_format_of :family_name_kana, :first_name_kana, with: /\p{katakana}/
end
