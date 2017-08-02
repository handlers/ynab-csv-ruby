class DateConverter
  attr_reader :date_string

  def initialize(date_string)
    @date_string = date_string
  end

  # Converts input date_string to a Date object
  #
  # @return [Date]
  def to_date
    Date.strptime(date_string, "%m/%d/%Y")
  end
end