require 'rspec'
require_relative 'due_date'

# Story: As a developer, I can create a to do item with a due date, which can be changed.
# Hint: Use the Date class

describe DueDate do
  it "should be a thing" do
    expect{DueDate.new("laundry","clean clothes",2016,05,15)}.to_not raise_error
  end

  it "should have a due date that I can set" do
    expect(DueDate.new("laundry","clean clothes",2016,5,16).duedate).to eq Date.new(2016,5,16)
  end

  it "should be able to change the due date" do
    task = DueDate.new("laundry","clean clothes",2017,05,16)
    task.change_duedate(2015,05,12)
    expect(task.duedate).to eq Date.new(2015,5,12)
  end

# Story: As a developer, I can print an item with a due date with field labels and values.

  it "can print an item with it's values" do
    task = DueDate.new("laundry","clean clothes",2017,05,16)
    expect(task.ugly_print).to eq "Title: laundry Description: clean clothes Due Date: 2017-05-16 Status: incomplete"
  end

end
