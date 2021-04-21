require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = ToDo.new("Buy milk")
    @todo2 = ToDo.new("Clean room")
    @todo3 = ToDo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = ToDoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    shifted = @list.shift
    assert_equal(@todo1, shifted)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    popped = @list.pop
    assert_equal(@todo3, popped)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_raise_type
    assert_raises(TypeError) { @list.add('Hallo') }
    assert_raises(TypeError) { @list.add(123) }
  end

  def test_shovel
    new_to_do = ToDo.new('Shovel driveway')
    @list << new_to_do
    @todos << new_to_do

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_to_do = ToDo.new('Shovel driveway')
    @list.add(new_to_do)
    @todos << new_to_do
    
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todos[1], @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todos[0].done?)
    assert_equal(true, @todos[1].done?)
    assert_equal(false, @todos[2].done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_done_at(1)
    assert_equal(true, @todos[1].done?)
    @list.mark_undone_at(1)
    assert_equal(false, @todos[1].done?)
  end

  def test_done_bang
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @list.mark_done_at(1)

    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    @list.done!

    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |to_do| to_do.done! }
    assert_equal(true, @list.done?)
  end

  def test_each_return
    assert_equal(@list, @list.each { nil })
  end

  def test_select
    @todo1.done!
    new_list = ToDoList.new(@list.title)
    new_list.add(@todo1)

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_s, @list.select { |to_do| to_do.done? }.to_s)
  end

end