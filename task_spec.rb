require 'rspec'
require_relative 'task'

# Story: As a developer, I can create a Task.

describe Task do

  it "should be a thing" do
    expect {Task.new("dishes","clean dishes")}.to_not raise_error
  end

  # Story: As a developer, I can give a Task a title and retrieve it.

  it "should have a title do" do
    expect(Task.new("make bed", "tidy bed").title).to be_a String
  end

  it "can be any type of task" do
    expect(Task.new("mop","clean floors").title).to eq "mop"
  end

  # Story: As a developer, I can give a Task a description and retrieve it.

  it "has a description" do
    expect(Task.new("laundry","clean clothes").description).to be_a String
  end

  it "can be given a description" do
    expect(Task.new("laundry","clean clothes").description).to eq "clean clothes"
  end

  # Story: As a developer, I can print a Task with field labels and values.

  it "can print a Task with field labels and values" do
    expect(Task.new("sdfs","dsfs").pretty_print).to eq "Title: sdfs Description: dsfs"
  end

  # Story: As a developer, I can mark a Task done.

  it "can show if it is done" do
    task1 = Task.new("laundry","clean clothes")
    task1.mark_done
    expect(task1.done?).to be true
  end

  it "can be marked done" do
    expect(Task.new("laundry","clean clothes").mark_done).to eq "done"
  end

  # Story: As a developer, when I print a Task that is done the status is shown.

  it "will print the status if the task is complete" do
    task1 = Task.new("laundry","clean clothes")
    task1.mark_done
    expect(task1.pretty_print).to eq "Title: laundry Description: clean clothes Status: done"
  end

end
