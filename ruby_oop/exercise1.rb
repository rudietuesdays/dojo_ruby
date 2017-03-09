class CodingDojo
  @@no_of_branches = 0 # class varaibles have 2 @ signs - available for all functions, instances and objects for that class (note used very often)
  # global variables start with a $ , but those are not used often

  def initialize(id, name, address)
    @branch_id = id  #a regular variable in ruby is an instance variable; it starts with 1 @ sign and are available for all methods for that object (used a lot!)
    @branch_name = name
    @branch_address = address
    @@no_of_branches += 1
    puts "\nCreated branch #{@@no_of_branches}"
  end
  def hello
    puts "Hello CodingDojo!"
    self
  end
  def display_all
    puts "Branch ID: #{@branch_id}"
    puts "Branch Name: {@branch_name}"
    puts "Branch Address: #{@branch_address}"
  end
end

# now using above class to create objects
# branch = CodingDojo.new(253, "SF CodingDojo", "Sunnyvale CA")
# branch.hello.display_all
# branch2 = CodingDojo.new(155, "Boston CodingDojo", "Boston MA")
# branch2.display_all

##################################################

class Fixnum
  def who_am_i
    puts self
  end
end
class String
  def who_am_i
    puts self
  end
end
# 4.who_am_i # => 4
# 15.who_am_i # => 15
# "string".who_am_i # => "string"
# "hello_world".who_am_i # => "hello_world"

##################################################

class Mammal
  def initialize
    puts "I am alive"
    self
  end
  def breath
    puts "Inhale and exhale"
    self
  end

  def eat
    puts "Yum yum yum"
  end

  def calling_speak
    speak
  end

  def calling_cry
    cry
  end

  def who_am_i
    puts self # printing the current object
    self
  end

  protected
    def speak
      puts "I am a protected method"
    end

  private
    def cry
      puts "Sniff sniff..."
    end

end

class Human < Mammal # Human inherits from Mammal
  def subclass_method
    breath
  end

  def another_method
    self.eat
  end

  def explicitily_speak
    self.speak
  end

  def implicitily_speak
    speak
  end

  def explicitily_cry
    self.cry
  end

  def implicitily_cry
    cry
  end

end
# my_mammal = Mammal.new # => "I am alive"
# my_mammal.who_am_i # => #<Mammal:0x007f9e86025dd8>
# my_mammal.who_am_i.breath # => undefined method `breath' for nil:NilClass (NoMethodError)
# my_mammal = Mammal.new.who_am_i.breath

mammal = Mammal.new
# mammal.speak # => protected method `speak' called for #<Mammal:0x007fa5438183d8> (NoMethodError)
# mammal.calling_speak # => I am a protected method
# mammal.calling_cry # => Sniff sniff...
# mammal.speak # => private method `cry' called for #<Mammal:0x007fd9830de5f8> (NoMethodError)

person = Human.new
# person.speak # => protected method `speak' called for #<Human:0x007fedfe824710> (NoMethodError)
# person.explicitily_speak # => I am a protected method
# person.implicitily_speak # => I am a protected method
# person.cry # => private method `cry' called for #<Human:0x007f8f298de248> (NoMethodError)
# person.explicitily_cry # => `explicitily_cry': private method `cry' called for #<Human:0x007f87a30bf450> (NoMethodError)
# person. implicitily_cry # => Sniff sniff...

# Different kinds of methods:
# public - methods that can be called within the class, subclasses and instances without restriction.
# protected - methods that can only be called within the class and subclasses either explicitily or implicitily
# private - methods that can only be called within the class and subclasses implicitily

##################################################

def splatting *params
 params
end
puts splatting(1).inspect # => [1]
puts splatting(1, 2, 3, 4, 5).inspect # => [1, 2, 3, 4, 5]
# => All the arguments are condensed into a single array.
