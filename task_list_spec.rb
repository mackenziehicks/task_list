require 'rspec'
require_relative  'task_list'
require 'pry'


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
    dated_task = DueDate.new("buy baloons","buy some freaking balloons",1993,1,10)
    to_do_list = Tasklist.new
    expect(to_do_list.add_task(dated_task)).to include dated_task
  end

  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.

  it "will show only incompleted items due today" do
    item1 = DueDate.new("Laundry", "clean clothes",2016,8,22)
    item2 = DueDate.new("make bed", "tidy sheets", 2016,8,19)
    item3 = DueDate.new("dust", "dust", 2016,8,19)
    item3.mark_done
    to_do_list = Tasklist.new
    to_do_list.add_task(item1)
    to_do_list.add_task(item2)
    to_do_list.add_task(item3)
    expect(to_do_list.show_due_today).to match_array [item2]
  end


  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  it "can list all incomplete items in order of due date" do
    item1 = DueDate.new("Laundry", "clean clothes",2019,8,22)
    item2 = DueDate.new("make bed", "tidy sheets", 2016,8,19)
    item3 = DueDate.new("dust", "dust", 2017,8,19)
    to_do_list = Tasklist.new
    to_do_list.add_item(item1)
    to_do_list.add_item(item2)
    to_do_list.add_item(item3)
    expect(to_do_list.sort_items).to eq [item2, item3,item1]
  end



  # Story: As a developer with a TaskList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.

  it "can order tasks and items with due dates by due date followed by tasks without duedate" do
    item1 = DueDate.new("Laundry", "clean clothes",2019,8,22)
    item2 = DueDate.new("make bed", "tidy sheets", 2016,8,19)
    item3 = DueDate.new("dust", "dust", 2017,8,19)
    task1 = Task.new("furniture","buy new mattress")
    task2 = Task.new("call mom","tell her about your week")
    item3.mark_done
    to_do_list = Tasklist.new
    to_do_list.add_item(item1)
    to_do_list.add_item(item2)
    to_do_list.add_item(item3)
    to_do_list.add_task(task1)
    to_do_list.add_task(task2)
    to_do_list.sort_items
    expect(to_do_list.show_incomplete).to eq [item2,item1,task1,task2]
  end

  # Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.

  it "can add tasks, duedates and anniversary items and list all the incompleted ones in order of due date and yearly dates for the current month" do
    item1 = DueDate.new("Laundry", "clean clothes",2019,10,22)
    item2 = DueDate.new("make bed", "tidy sheets", 2016,8,19)
    item3 = DueDate.new("dust", "dust", 2017,8,19)
    item4 = DueDate.new("dust", "dust", 2017,8,19)
    task1 = Task.new("furniture","buy new mattress")
    task2 = Task.new("call mom","tell her about your week")
    anniversary1 = Anniversary.new("Mom's bday","send card", 2016,8,9)
    anniversary2 = Anniversary.new("Dad's bday","send card", 2016,9,14)
    to_do_list = Tasklist.new
    to_do_list.add_item(item1)
    to_do_list.add_item(item2)
    to_do_list.add_item(item3)
    to_do_list.add_item(item4)
    item4.mark_done
    to_do_list.add_task(task1)
    to_do_list.add_task(task2)
    to_do_list.add_anniversary(anniversary1)
    to_do_list.add_anniversary(anniversary2)
    to_do_list.merge_lists

  end


  # Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.





end
