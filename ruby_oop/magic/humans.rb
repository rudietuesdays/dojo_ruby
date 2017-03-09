class Human
    @@samurais = 0
    attr_accessor :name, :strength, :intelligence, :stealth, :health
    def initialize(name)
        @name = name
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end

    def attack(fellow)
        unless fellow.class.ancestors.include?(Human)
            puts "You can't attack that!"
            false
        else
            fellow.health -= 2
            puts "Ouch! #{fellow.name}\'s health decreased by 2 HP."
            true
        end
    end
end

class Wizard < Human
    def initialize(name)
        super
        @health = 50
        @intelligence = 25
    end

    def heal
        @health += 10
        puts "#{@name}\'s HP is now #{@health}"
        self
    end

    def fireball(fellow)
        if fellow.class.ancestors.include?(Human)
            fellow.health -= 20
            puts "Ouch! #{fellow.name}\'s HP decreased by 20."
        else
            puts "Your power only works on humans..."
        end
        self
    end
end

class Ninja < Human
    def initialize(name)
        super
        @stealth = 175
    end

    def steal(obj)
        unless obj.class.ancestors.include?(Human)
            @health -= 10
            puts "You stole #{obj}, but your health decreased 10 HP."
        else
            puts "You can't steal humans!..."
        end
        self
    end

    def get_away
        @health -= 15
        puts "Phew, you got away! But your health decreased by 15 HP."
    end

end

class Samurai < Human
    def initialize(name)
        super
        @health = 200
        @@samurais += 1
    end

    def death_blow(obj)
        unless obj.class.ancestors.include?(Human)
            puts "You destroyed #{obj}! Now you need a nap."
            @health = 0
        else
            puts "That's so mean, you really want to try death-ing on a human??"
        end
        self
    end

    def meditate
        @health = 200
        puts "That was a good rest. Your HP is now full."
        self
    end

    def how_many
        puts "There are #{@@samurais} samurais lurking about."
        self
    end

end

person1 = Human.new("rae")
person2 = Human.new("lisa")
wizard1 = Wizard.new("dumbledore")
ninja1 = Ninja.new("chun-li")
samurai1 = Samurai.new("jack")
samurai2 = Samurai.new("jane")
samurai3 = Samurai.new("M. Bison")
person1.attack(person2)
wizard1.fireball(person1).fireball('tree').heal
ninja1.steal("money").steal(wizard1).get_away
samurai1.death_blow(ninja1).death_blow("table").meditate.how_many
