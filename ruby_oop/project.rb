class Project
  # your code here
  attr_reader :name, :descrip # this line not needed if using "def name" method later
  def initialize(name, description)
      @name = name
      @descrip = description
  end
  # def name
  #     puts "#{@name}"
  # end
  def elevator_pitch
      puts "#{@name}, #{@descrip}"
  end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.name # => "Project 1"
project1.elevator_pitch  # => "Project 1, Description 1"
