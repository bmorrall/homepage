# This will guess the UserAccount class
FactoryBot.define do
  factory :user_account do
    sequence(:uid) { |n| 1000 + n }
    provider { "facebook" }
    user
  end
end
