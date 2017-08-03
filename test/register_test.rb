require "minitest/autorun"
require_relative "../lib/ynab-csv"

class TestRegister < Minitest::Test
  def setup
    fixture_file = File.join(File.dirname(__FILE__), "./fixtures/register.csv")
    @register = YnabCsv::Register.new(fixture_file)
  end

  def test_cast_csv_to_transactions
    transactions = @register.send(:cast_csv_to_transactions)
    assert_equal transactions.class, Array

    transactions.each do |transaction|
      assert_equal transaction.class, YnabCsv::Transaction
    end
  end
end
