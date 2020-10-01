FactoryBot.define do
  factory :item do
    name {Faker::Name.initials}
    explanatory {Faker::Lorem.sentence}
    price {400}
    category {1}
    status {3}
    fee {2}
    shipmentsource {20}
    timerequired {3}
    association :user 

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
