FactoryGirl.define do
  sequence(:email) { |n| "user_#{n}@email.com" }
  factory :user do
    email
    password 'password'
  end
end

