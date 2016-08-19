require 'rspec'
require 'date'
require_relative 'task'
require_relative 'task_list'

class DueDate < Task

  def initialize(title, description, year, month, day)
    super(title,description)
    @duedate = Date.new(year, month, day)
  end

  def duedate
    @duedate
  end

  def change_duedate (year, month, day)
    @duedate = Date.new(year, month, day)
  end

  def ugly_print
    "Title: " + @title + " Description: " + @description + " Due Date: " + @duedate.iso8601 + " Status: " + @status
  end


end
