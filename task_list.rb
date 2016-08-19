require 'rspec'
require_relative  'task'
require_relative 'due_date'
require_relative 'anniversary'


class Tasklist

  def initialize
    @tasklist = []
    @itemlist = []
    @anniversarylist = []
    @mergedlist
  end

  def add_task(task)
    @tasklist << task
  end

  def add_item(item)
    @itemlist << item
  end

  def add_anniversary(anniversary)
    @anniversarylist << anniversary
  end

  def tasklist
    @tasklist
  end

  def itemlist
    @itemlist
  end

  def anniversarylist
    @anniversarylist
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

    incomplete_items = @itemlist.select { |item| item.done? == false }
    incomplete_items.each { |item| puts item.pretty_print}

    # return done tasks
    (incomplete_items << incomplete_tasks).flatten
  end

  def show_due_today
    due_today = @tasklist.select { |item| item.done? == false && item.duedate == Date.today}
  end

  def sort_items
    @itemlist = @itemlist.sort do |item1, item2|
      item1.duedate.iso8601 <=> item2.duedate.iso8601
    end
  end

  def sort_merged_lists
    @mergedlist = @mergedlist.sort do |item1, item2|
      item1.duedate.iso8601 <=> item2.duedate.iso8601
    end
  end

  def merge_lists
   @mergedlist = (@itemlist << @anniversarylist).flatten
 end

 # def sort_incomplete_items
 #   incomplete_tasks = @tasklist.select { |task| task.done? == false }
 #   incomplete_tasks.itemlist.sort_items
 # end

  # def sort_only_duedates
  #   duedates = @tasklist.select {|item| item.class == DueDate && item.done? == false}
  #     @tasklist2 = duedates.sort do |item1, item2|
  #     item1.duedate.iso8601 <=> item2.duedate.iso8601
  #   end
  # end

  # def put_tasks_at_end
  #   @tasklist.each do |item|
  #     if item.class == Task
  #       @tasklist2.insert(@tasklist.length-1)
  #       @tasklist = @tasklist2
  #     end
  #   end
  # end

end
