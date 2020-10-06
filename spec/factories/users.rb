FactoryBot.define do
  factory :user do
    nickname              {"jona"}
    email                 {Faker::Internet.free_email}
    password              {"aaaa00"}
    password_confirmation {password}
    firstname             {"松崎"}
    lastname              {"聡"}
    lastname_jp           {"マツザキ"}
    firstname_jp          {"サトシ"}
    birthday              {"2000/01/01"}
  end
end
