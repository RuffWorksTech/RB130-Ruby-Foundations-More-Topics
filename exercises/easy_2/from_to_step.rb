def step(start, stop, step)
  accumulator = start
  yield(accumulator)
  until accumulator >= stop
    accumulator += step
    yield(accumulator)
  end
  accumulator
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# A good return value of this method should be the last evaluated value.