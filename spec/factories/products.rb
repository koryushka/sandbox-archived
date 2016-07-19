FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1.5
    description "MyString"
    can_purchase false
    sold_out false
  end
end
