require "minitest/autorun"
require_relative "../lib/ynab-csv"

class CurrencyConverterTest < Minitest::Test
  def test_to_cents_simple
    currency_string = "$10"

    assert_equal YnabCsv::CurrencyConverter.new(currency_string).to_cents, 1000
  end

  def test_to_cents_complex
    currency_string = "$10.99"

    assert_equal YnabCsv::CurrencyConverter.new(currency_string).to_cents, 1099
  end

  def test_to_cents_less_than_a_dollar
    currency_string = "$.99"

    assert_equal YnabCsv::CurrencyConverter.new(currency_string).to_cents, 99
  end

  def test_to_cents_less_than_a_dollar_with_leading_zero
    currency_string = "$0.99"

    assert_equal YnabCsv::CurrencyConverter.new(currency_string).to_cents, 99
  end
end
