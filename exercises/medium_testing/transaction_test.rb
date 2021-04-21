require 'pry'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(18)
  end

  def test_prompt_for_payment
    input = StringIO.new("20\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(20, @transaction.amount_paid)
  end
end