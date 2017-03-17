# include our Project class in our spec file
require_relative 'tdd_example'

RSpec.describe Project do
  before(:each) do
    # create new projects and make sure we can set the name attribute
    @project1 = Project.new('Project 1', 'description 1', 'owner 1')
    @project2 = Project.new('Project 2', 'description 2', 'owner 2')
  end
  it 'has a getter and setter for name and owner attributes' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
    @project1.owner = "New Owner"
    expect(@project1.owner).to eq("New Owner")
  end
  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2")
  end

  describe "project tasks" do
    it 'has a method add_task to add a task to the array' do
      # @project1.add_task("shovel the driveway")
      # expect(@project1.tasks).to include("shovel the driveway")
      ## OR...
      1.upto(4) {|n| @project1.add_task("Task no. #{n}")}
      expect(@project1.tasks).to eq(["Task no. 1", "Task no. 2", "Task no. 3", "Task no. 4"])
    end
    it 'has a method print_tasks that puts all the tasks to the terminal' do
      # @project1.add_task("shovel the driveway")
      # @project1.add_task("laundry")
      # expect{ @project1.print_tasks}.to output("shovel the driveway\nlaundry\n").to_stdout
      ## OR...
      1.upto(4) {|n| @project1.add_task("Task no. #{n}")}
      expect{ @project1.print_tasks}.to output("Task no. 1\nTask no. 2\nTask no. 3\nTask no. 4\n").to_stdout
    end
  end
end
