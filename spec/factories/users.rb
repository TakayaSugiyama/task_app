FactoryBot.define do
  factory :user do
    id {1}
    name { "リラックマ" }
    email { "relaxbear@gmail.com" }
    password { "relaxbear" } 
    admin {true}
  end
end
