def drop_while(arr)
  result = []
  arr.each_with_index do |el, idx|
    next if yield(el)
    (arr[idx..-1]).each { |n| result << n } unless yield(el)
    break
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } #== [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } #== []
p drop_while([1, 3, 5, 6]) { |value| false } #== [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } #== [5, 6]
p drop_while([]) { |value| true } #== []