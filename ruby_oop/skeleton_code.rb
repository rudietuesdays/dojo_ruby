class MyClass
  def some_method
    puts "This is an instance method"
  end

  def self.foo
    puts "This is a class method"
  end

end

something = MyClass.new
something.some_method  # => "This is an instance method"

u.foo # => NoMethodError: undefined method `foo'
User.foo # => "This is a class method"

##### Controllers #####
class UsersController < ApplicationController
 def index
 end

 def new
 end
end

##### Flash Messages #####
# (used in controllers)
redirect_to root_url, flash: { referral_code: 1234 }
redirect_to root_url, notice: "You have successfully logged out."
redirect_to root_url, alert: "You're stuck here!"

##### Session Data #####
#clear an entire session with:
session.clear (or: reset_session)

###### terminal commands ######
rails s -b 0.0.0.0 #run server
rails g model ModelName variable:type first_name:string
rails generate controller <ControllerName> <methods space separated>
