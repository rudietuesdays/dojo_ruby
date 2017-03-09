class User
    # def first_name
    #     @first_name
    # end

    # attr_reader :last_name
    # attr_writer :last_name

    attr_accessor :first_name, :last_name
    def initialize(f_name, l_name)
        @first_name = f_name
        @last_name = l_name
    end

    def full_name
        puts "I am #{@first_name} #{@last_name}"
    end

    def say_hello
        puts "Hello!"
    end

end

# user1 = User.new
# user2 = User.new
# puts user1 == user2 # => false
# user1.first_name = 'rae'
# puts user1.inspect

rae = User.new("rae", "gaines")
rae.full_name
rae.say_hello
