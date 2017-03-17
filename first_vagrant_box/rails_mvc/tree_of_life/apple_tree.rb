class AppleTree
  attr_accessor :age
  attr_reader :height, :apple_count
  attr_writer :picked_apples

  def initialize
    @age = 0
    @height = 0
    @apple_count = 0
  end

  def year_gone_by
    @age += 1
    @height *= 0.10 # += ten_percent_of(@height)
    # @apple_count += 2 if (4..7).include?(@age)
    if @age >= 3 and @age < 7
      @apple_count += 2
    elsif @age < 3
      raise "This tree has some growing to do before it can grow apples..."
    else
      raise "This old tree won't be growing more apples."
    end
  end

  def pick_apples
    @picked_apples = @apple_count
    @apple_count = 0
    self
  end

  #if using ten_percent_of:
  # private
  # def ten_percent_of h
  #   (h * 0.1).round(2)
  # end

end
