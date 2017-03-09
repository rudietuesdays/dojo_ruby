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
