require 'minitest/autorun'

require_relative 'car'

describe 'Char#wheels' do
  it 'has 4 wheels' do
    car = Car.new
  _(car.wheels).must_equal 4
  end
end