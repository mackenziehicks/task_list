require 'rspec'
require 'date'
require_relative 'task'
require_relative 'task_list'

class DueDate < Task

  def initialize(title, description, date)

    # FIXME
    super(title,description)
    @duedate = Date.strptime(date, %y-%m-%d)
  end

  def duedate
    @duedate
  end

  def change_duedate (new_date)
    @duedate = (new_date)
  end

  def ugly_print
    "Title: " + @title + " Description: " + @description + " Due Date: " + @duedate + " Status: " + @status
  end


end
