def step(start, stop, step)
  accum = start
  while accum <= stop do
    yield(accum)
    accum += step
  end
  Range.new(start, stop)
end

step(1, 10, 3) { |value| puts "value = #{value}" }