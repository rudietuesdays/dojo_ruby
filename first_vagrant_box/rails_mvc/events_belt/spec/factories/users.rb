FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    email "jane@coder.com"
    city "New York"
    state "NY"
    password "password"
  end
end
