# This will guess the User class
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "Password1" }
  end
end
