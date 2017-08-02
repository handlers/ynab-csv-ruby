require "minitest/autorun"
require_relative "../lib/ynab"

class TestTransaction < Minitest::Test
  def setup
    @transaction = Transaction.new
  end
end
