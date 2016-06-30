FactoryGirl.define do
  # sequence(:email) { |n| "user_#{n}@email.com" }
  factory :user do
    email 'test@email.com'
    password 'password'
  end
end

