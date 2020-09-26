class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6}+\z/
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6}, confirmation: true, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :lastname_jp, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :firstname_jp, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birthday
  end

end
