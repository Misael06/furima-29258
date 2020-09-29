class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :user

  with_options presence: true do
    validates :item_image
    validates :name
    validates :explanatory
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}, 
              :numericality => { greater_than_or_equal_to: 300, less_than: 10000000, message:"Out of setting range"} 
  end
  with_options exclusion: { in: %w(---),message: "Select" } do
    validates :category
    validates :status
    validates :fee
    validates :shipmentsource
    validates :timerequired
  end
end
