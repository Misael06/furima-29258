class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6}, confirmation: true, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"} do
      validates :lastname
      validates :firstname
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"} do
      validates :lastname_jp
      validates :firstname_jp
    end
  end
end
