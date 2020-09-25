class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, uniqueness: true
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :firstname, { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :lastname_jp, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :firstname_jp, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end

end
