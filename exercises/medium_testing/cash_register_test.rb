require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(18)
    @transaction.amount_paid = 20
  end

  def test_accept_money
    orig_amt = @register.total_money
    @register.accept_money(@transaction)
    new_amt = @register.total_money
    
    assert_equal(orig_amt + 20, new_amt)
  end
  
  def test_change
    assert_equal(2, @register.change(@transaction))
  end
  
  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    @transaction = Transaction.new(18)

    input = StringIO.new('20\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal(20, @transaction.amount_paid)
  end
end