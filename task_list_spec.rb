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

  # Story: As a developer, I can add items with due dates to my TaskList.
  # Hint: Consider keeping items with due dates separate from the other items.

  it "will hold tasks with due dates" do
    dated_task = DueDate.new("buy baloons","buy some freaking balloons","1/10/93")
    tasklist = Tasklist.new
    expect(tasklist.add_task(dated_task)).to include dated_task
  end

  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
  # FIXME
  it "will show only incompleted items due today" do
    item1 = DueDate.new("Laundry", "clean clothes","2016-08-18")
    item2 = DueDate.new("make bed", "tidy sheets", "2016-08-19")
    tasklist = Tasklist.new
    tasklist.add_task(item1)
    tasklist.add_task(item2)
    expect(tasklist.show_due_today).to match_array [item1]
  end


  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.



  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.




end
