class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :BirthDay, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-z\d]+@[a-z\d]+\.[a-z]+\z/i }
  validates :password, presence: true, confirmation: true, format: { with: /\A[a-z\d]{6,}\z/ }
  validates :password_confirmation, presence: true
  validates :kanji_last_name, :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :kana_last_name, :kana_first_name, presence: true, format: { with: /\A[ァ-ン]+\z/ }
end
