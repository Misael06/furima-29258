class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :shipmentsource
  belongs_to_active_hash :timerequired
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
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :shipmentsource_id
    validates :timerequired_id
  end
end
