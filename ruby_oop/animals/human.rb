puts 'I am in the human file'
require_relative 'mammal'
class Human < Mammal
end

class Dog < Mammal
    def pet
        @health += 5
        self
    end

    def walk
        @health -= 1
        self
    end

    def run
        @health -= 10
        self
    end
end

class Lion < Mammal
    def initialize
        super
        @health = 170
    end

    def fly
        @health -= 10
        self
    end

    def attack_town
        @health -= 50
        self
    end

    def eat_humans
        @health += 20
        self
    end

    def display_health
        puts "I am a lion!! RAAWWWWWWRRRR"
        # puts "HP: #{@health}"
        super
        self
    end

end


dog = Dog.new
dog.walk.walk.walk.run.run.pet.display_health

lion = Lion.new
lion.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health
