require "minitest/autorun"
require_relative "../lib/ynab"
require "pry"

class DateConverterTest < Minitest::Test
  def test_to_date_simple
    date_string = "08/01/2017"

    assert_equal DateConverter.new(date_string).to_date, Date.new(2017, 8, 1)
  end

  def test_to_date_without_padding
    date_string = "8/1/2017"

    assert_equal DateConverter.new(date_string).to_date, Date.new(2017, 8, 1)
  end

  def test_to_date_without_slashes
    date_string = "Dec 2012"

    assert_equal DateConverter.new(date_string).to_date, Date.new(2012, 12)
  end
end
