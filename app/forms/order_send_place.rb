class OrderSendPlace

  include ActiveModel::Model
  attr_accessor :token, :postalcode, :prefecture_id, :municipality, :homeadress, :building, :phonenumber, :item_id, :user_id

  with_options presence: true do
    validates :token, presence: true
    validates :postalcode, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :homeadress
    validates :phonenumber, format: { with: /\A\d{10,11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
    order = Order.create(token: token, item_id: item_id, user_id: user_id)
    SendPlace.create(postalcode: postalcode, prefecture_id: prefecture_id, municipality: municipality, homeadress: homeadress, building: building, phonenumber: phonenumber, order_id: order.id)
  end
end