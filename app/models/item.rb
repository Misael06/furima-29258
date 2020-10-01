class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :user

  with_options presence: true do
    validates :item_image
    validates :name
    validates :explanatory
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}, 
              numericality: { only_intreger: true, greater_than: 300, less_than: 9999999} 
  end
  with_options numericality: { other_than: 0, message: "Select" } do
    validates :category
    validates :status
    validates :fee
    validates :shipmentsource
    validates :timerequired
  end
end
