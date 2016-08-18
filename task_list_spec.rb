require 'rspec'
require_relative  'task_list'

describe Tasklist do
  it "should be a thing" do
    expect{Tasklist.new}.to_not raise_error
  end


  # Story: As a developer, I can add all of my Tasks to a TaskList.

  it "should hold multiple tasks" do
    task1 = Task.new("Laundry", "clean clothes")
    expect(Tasklist.new.add_task(task1)).to include task1
  end


  # Story: As a developer with a TaskList, I can show all the completed items.

  it "will show only completed task" do
    task1 = Task.new("Laundry", "clean clothes")
    task2 = Task.new("make bed", "tidy sheets")
    task1.mark_done
    tasklist = Tasklist.new
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    expect(tasklist.show_done).to match_array [task1]
  end

  # Story: As a developer with a TaskList, I can show all the not completed items.

  it "will show only incompleted task" do
    task1 = Task.new("Laundry", "clean clothes")
    task2 = Task.new("make bed", "tidy sheets")
    task1.mark_done
    tasklist = Tasklist.new
    tasklist.add_task(task1)
    tasklist.add_task(task2)
    expect(tasklist.show_incomplete).to match_array [task2]
  end

end
