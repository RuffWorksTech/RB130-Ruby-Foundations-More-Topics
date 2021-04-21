require 'minitest/autorun'
require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name
    assert_equal(@kitty.name, 'Milo')
  end

  def test_miaow
    assert(@kitty.miaow.include?(' is miaowing.'))
  end

  def test_raises_error
    assert_raises(ArgumentError) { Cat.new }
  end
  
  # def test_is_not_purrier
  #   patch = Cat.new('Patch', 5)
  #   milo = Cat.new('Milo', 3)
  
  #   refute(patch.purr_factor > milo.purr_factor)
  # end
end