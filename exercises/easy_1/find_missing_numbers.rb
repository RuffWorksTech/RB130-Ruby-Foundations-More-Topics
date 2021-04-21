def missing(arr)
  full_range = Array(arr.first..arr.last)

  full_range.each_with_object([]) do |num, missing_nums|
    missing_nums << num if !arr.include?(num)
  end
end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #= [2, 3, 4]
p missing([6]) #== []