require 'pry'

# .times
# ----------------------------------------------
# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end

#   number
# end

# times(5) do |num|
#   puts num
# end


# .each
# -----------------------------------------------
# def each(array)
#   counter = 0
  
#   while counter < array.size
#     yield(array[counter])
#     counter += 1
#   end
  
#   array
# end

# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end


# .select
# -----------------------------------------------
# def select(arr)
#   true_arr = []
#   counter = 0
  
#   while counter < arr.size
#     true_arr << arr[counter] if yield(arr[counter])
#     counter += 1
#   end

#   true_arr
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


# .reduce
# -----------------------------------------------
def reduce(arr, accumulator = 0)
  accumulator = '' if arr.first.is_a? String
  accumulator = [] if arr.first.is_a? Array
  accumulator = {} if arr.first.is_a? Hash

  counter = 0

  while counter < arr.size
    accumulator = yield(accumulator, arr[counter])
    counter += 1
  end

  accumulator  
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']