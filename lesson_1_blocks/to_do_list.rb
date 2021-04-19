# This class represents a todo item and its associated data: name and description. There's also a "done" flag to show whether this todo item is done.

require 'pry'

class ToDo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
    self
  end

  def done?
    done
  end

  def undone!
    self.done = false
    self
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class ToDoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @to_dos = []
  end

  def size
    @to_dos.size
  end

  def first
    @to_dos.first
  end

  def last
    @to_dos.last
  end

  def shift
    @to_dos.shift
  end

  def pop
    @to_dos.pop
  end

  def done?
    @to_dos.all? { |to_do| to_do.done? }
  end

  def <<(to_do)
    raise TypeError, 'Can only add ToDo objects.' unless to_do.is_a? ToDo
    @to_dos << to_do
  end
  alias_method :add, :<<

  def item_at(idx)
    @to_dos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @to_dos.each_index { |idx| mark_done_at(idx) }
  end

  def remove_at(idx)
    @to_dos.delete(item_at(idx))
  end

  def to_a
    @to_dos
  end

  def to_s
    <<~MSG
    ---- #{title} ----
    #{@to_dos.map(&:to_s).join("\n")}
    MSG
  end

  def each
    @to_dos.each { |to_do| yield(to_do) }
    self
  end

  def select
    true_list = ToDoList.new(title)
    each do |to_do|
      true_list << to_do if yield(to_do)
    end
    true_list
  end
  
  def find_by_title(title)
    select { |to_do| to_do.title == title }.first
  end
  
  def all_done
    select { |to_do| to_do.done? }
  end
  
  def all_not_done
    select { |to_do| !to_do.done? }
  end
  
  def mark_done(title)
    find_by_title(title).done!
  end
  
  def mark_all_done
    all_not_done.each { |to_do| to_do.done! }
  end
  
  def mark_all_undone
    all_done.each { |to_do| to_do.undone! }
  end
end


# given
todo1 = ToDo.new("Buy milk")
todo2 = ToDo.new("Clean room")
todo3 = ToDo.new("Go to gym")
list = ToDoList.new("Today's Todos")

# ---- Adding to the list -----

# add
puts "Add: #{list.add(todo1)}"                 # adds todo1 to end of list, returns list
puts "Add: #{list.add(todo2)}"                 # adds todo2 to end of list, returns list
puts "Add: #{list.add(todo3)}"                 # adds todo3 to end of list, returns list

todo1.done!

puts list

p list.find_by_title("Buy milk")
p list.all_done
p list.all_not_done

p list.mark_done("Clean room")

puts list

list.mark_all_done

puts list

list.mark_all_undone

puts list