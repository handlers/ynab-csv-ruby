require "minitest/autorun"
require_relative "../lib/ynab_csv"

class TestTransaction < Minitest::Test
  def setup
    @transaction = YnabCsv::Transaction.new
  end
end
