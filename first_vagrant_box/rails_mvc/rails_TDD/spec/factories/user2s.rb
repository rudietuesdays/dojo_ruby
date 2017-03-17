FactoryGirl.define do

  # This is where we set which class we are creating a template for
  factory :user2 do

    # This is where set the default values for our template. If you don't modify these values when we build, our user's last_name will be filled with "Doe"

    #can add traits if you want multiple default options
    last_name "Doe"
    admin false
    trait :masc do
      first_name "John"
      email "john@doe.com"
    end
    trait :femme do
      first_name "Jane"
      email "jane@doe.com"
    end
    trait :admin do
      admin true
    end

    # can add dynamic values to instance attributes for randomness
    # wrap your methods in curly braces!
    full_name { "#{first_name} #{last_name}" }
    age {rand(21..60)}
  end
end
