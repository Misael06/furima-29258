FactoryBot.define do
  factory :item do
    name {Faker::Name.initials}
    explanatory {Faker::Lorem.sentence}
    price {400}
    category_id {1}
    status_id {3}
    fee_id {2}
    shipmentsource_id {20}
    timerequired_id {3}
    association :user 

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
