FactoryBot.define do
  factory :user do
    id {1}
    name { "リラックマ" }
    email { "relaxbear@gmail.com" }
    password { "relaxbear" } 
    admin {false}
  end
end
