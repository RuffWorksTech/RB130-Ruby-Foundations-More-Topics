def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(10) { |num| num + 5 } == 15
p compute('a') { |letter| letter + 'b' } == 'ab'
p compute('poop') == 'Does not compute.'