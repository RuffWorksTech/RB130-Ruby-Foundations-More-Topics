def max_by(arr)
  return nil if arr.empty?

  max_el = arr.first
  block_max = yield(arr.first)

  arr[1..-1].each do |n|
    block_run = yield(n)
    if block_run > block_max
      max_el = n
      block_max = block_run
    end
  end

  max_el
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil