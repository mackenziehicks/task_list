require 'rspec'
require_relative  'task'

class Tasklist

  def initialize
    @tasklist = []
  end

  def add_task(task)
    @tasklist << task
  end

  def show_done
    done_tasks = @tasklist.select { |task| task.done? == true }
    done_tasks.each { |task| puts task.pretty_print}
    # return done tasks
    done_tasks
  end

  def show_incomplete
    incomplete_tasks = @tasklist.select { |task| task.done? == false }
    incomplete_tasks.each { |task| puts task.pretty_print}
    # return done tasks
    incomplete_tasks
  end










end
