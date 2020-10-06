FactoryBot.define do
  factory :order_send_place do
    token {"tok_abcdefghijk00000000000000000"}
    postalcode {"111-1111"}
    prefecture_id {1}
    municipality {"札幌市"}
    homeadress {"札幌1-2-304"}
    phonenumber {12345678910}
    association :item
    association :user
  end
end