# This will guess the UserAccount class
FactoryGirl.define do
  factory :user_account do
    uid { [1000..9999].sample }
    provider 'facebook'
    user
  end
end

