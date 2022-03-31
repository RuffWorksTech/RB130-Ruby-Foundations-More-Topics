# def make_sandwich
#   puts "I'm making a sandwich!"
#   puts "Start with a slice of bread."
#   puts yield
#   puts "Finish off with another slice of bread!"
#   puts "Yum!"
# end

# ham_cheese = ["Spread Mustard.", "Add Lettuce.", "Add Sliced Ham.", "Add Cheese.", "Spread Mayo."]
# pbj = ["Spread Peanut Butter.", "Spread Jelly.", "Add Sliced Banana."]

# make_sandwich { ham_cheese }
# make_sandwich { pbj }



# I'm making a sandwich!
# Start with a slice of bread.
# Spread Mustard.
# Add Lettuce.
# Add Sliced Ham.
# Add Cheese.
# Spread Mayo.
# Finish off with another slice of bread!
# Yum!

# I'm making a sandwich!
# Start with a slice of bread.
# Spread Peanut Butter.
# Spread Jelly.
# Add Sliced Banana.
# Finish off with another slice of bread!
# Yum!

# -----------------------------------------------------------------------------------------------------------------------------------

# name = "Alice"

# def run
#   name = "Cassidy"
#   yield(name)
# end

# puts run { |name| "Hey there, #{name}" }
# name = "Bill"

# -----------------------------------------------------------------------------------------------------------------------------------

# def filter(arr, &block)
#   arr.select { |el| block.call(el) if block_given? }
# end


# arr = [1, 2, 3, 4, 5]

# filtered_arr = filter(arr) { |el| el != 3 }
# p filtered_arr                               # [1, 2, 4, 5]
# p arr                                        # [1, 2, 3, 4, 5]

# filtered_arr = filter(arr) { |el| el <= 3 }
# p filtered_arr                               # [1, 2, 3]
# p arr                                        # [1, 2, 3, 4, 5]

# filtered_arr = filter(arr)
# p filtered_arr                               # []
# p arr                                        # [1, 2, 3, 4, 5]

# -----------------------------------------------------------------------------------------------------------------------------------

# def do_something_silly(word)
#   yield word
# end

# do_something_silly("hello") do |word, another_word|
#   p word
#   p another_word
# end

# -----------------------------------------------------------------------------------------------------------------------------------

# def convert(str)
#   return str unless block_given?
  
#   str.chars.each_with_object('') { |char, new_str| new_str << yield(char) }
# end


# p convert('A simple string') { |char| char.upcase } # => "A SIMPLE STRING"
# p convert('xyyz') { |char| char + char }            # => xxyyyyzz
# bleh = convert('Ready? Set. Go!') do |char|
#   char == ' ' ? '' : char
# end
# p bleh
# p convert('a string')                        # => a string

# -----------------------------------------------------------------------------------------------------------------------------------

# p("Hello") do
#   p "Goodbye"
# end

# -----------------------------------------------------------------------------------------------------------------------------------

# class Rectangle
#   attr_accessor :height, :width, :color

#   def initialize
#     @height = 50
#     @width = 50
#     @color = :red
#     yield(self) if block_given?
#   end

#   def to_s
#     "#{height}x#{width} #{color} rectangle"
#   end
# end

# rect = Rectangle.new
# puts rect # => 50x50 red rectangle

# rect1 = Rectangle.new do |r|
#   r.height = 400
#   r.width = 300
#   r.color = :black
# end

# puts rect1 # => 400x300 black rectangle


# -----------------------------------------------------------------------------------------------------------------------------------

# def update_data(select_string, block)
#   data = fetch(select_string)
#   data.each { |employee| block.call(employee) }
#   save(data)
# end

# def update_by_type(type, &block)
#   update_data("employee_type = #{type}", block)
# end

# def update_by_location(location, &block)
#   update_data("employee_location = #{location}", block)
# end

# update_by_type("Manager") do |employee|
#   employee.salary *= 1.25
# end

# update_by_location("Oregon") do |employee|
#   employee.salary *= 1.10
# end

# -----------------------------------------------------------------------------------------------------------------------------------

# arr = ['a', 'b', 'c']

# def foo(array)
#   array.map do |el|
#     yield(el)
#   end
# end

# bro = foo(arr) do |value|
#   bar(value.ord).chr
# end

# hsh = { a: 3, b: 2, c: 5 }

# def bar(qux)
#   qux += 2
# end

# -----------------------------------------------------------------------------------------------------------------------------------

