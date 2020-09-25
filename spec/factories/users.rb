FactoryBot.define do
  factory :user do
    nickname              {"jona"}
    email                 {"kkk@gmail.com"}
    password              {"aaaa00"}
    password_confirmation {password}
    lastname              {"松崎"}
    firstname             {"聡"}
    lastname_jp           {"マツザキ"}
    firstname_jp          {"サトシ"}
    birthday              {"2000/01/01"}
  end
end
