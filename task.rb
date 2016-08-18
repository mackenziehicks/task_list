class Task

  def initialize(title, description)
    @title = title
    @description = description
    @status = "incomplete"
  end

  def title
    @title
  end

  def description
    @description
  end

  def pretty_print
    if @status == "done"
      "Title: " + @title + " Description: " + @description + " Status: " + @status
    else
      "Title: " + @title + " Description: " + @description
    end
  end

  def done?
    if @status == "done"
      true
    else
      false
    end
  end

  def mark_done
    @status = "done"
  end

end
