require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(18)
  end

  def test_accept_money
    initial_amt = @register.total_money
    @register.accept_money(@transaction)
    current_amt = @register.total_money
    
    assert_equal(initial_amt + @transaction.amount_paid, current_amt)
  end
  
  def test_change
    assert_equal(2, @transaction.amount_paid - @transaction.item_cost)
  end
  
  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end 
  end
end