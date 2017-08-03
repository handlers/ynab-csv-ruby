require "minitest/autorun"
require_relative "../lib/ynab-csv"

class TestBudget < Minitest::Test
  def setup
    fixture_file = File.join(File.dirname(__FILE__), "./fixtures/budget.csv")
    @register = YnabCsv::Budget.new(fixture_file)
  end

  def test_cast_csv_to_category_months
    category_months = @register.send(:cast_csv_to_category_months)
    assert_equal category_months.class, Array

    category_months.each do |category_month|
      assert_equal category_month.class, YnabCsv::CategoryMonth
    end
  end
end
