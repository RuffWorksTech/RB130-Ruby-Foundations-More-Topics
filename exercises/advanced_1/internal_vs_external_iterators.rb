factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

6.times { |n| puts "#{n}! == #{factorial.next}" }
puts "=========================="
6.times { |n| puts "#{n}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |n| puts "#{n}! == #{factorial.next}" }
puts "=========================="

factorial.each_with_index do |value, idx|
  puts "#{idx}! == #{value}"
  break if idx >= 5
end