class SendPlace < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :homeadress
    validates :phonenumber, format: { with: /\A\d{,11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
end
