FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1
    user # nil # can simplify by removing 'nil'
  end
end
