# require 'rspec'
# require_relative  'task'

class Anniversary

  def initialize(title, description, year, month, day)
    # super(title, description)
    @title = title
    @description = description
    @anniversary = Date.new (year,month,day)
  end

  def anniversary_print
    "Title: " + @title + " Description: " + @description + " Status: " + @status + " Anniversary: " + @anniversary
  end

  def duedate
    @anniversary
  end

end
