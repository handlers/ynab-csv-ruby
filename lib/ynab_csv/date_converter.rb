module YnabCsv
  class DateConverter
    attr_reader :date_string

    def initialize(date_string)
      @date_string = date_string
    end

    # Converts input date_string to a Date object. Accepts %m/%d/%Y or %b %Y
    #   e.g. (Dec 2017).
    #
    # @return [Date]
    def to_date
      if date_string.match(/\//)
        Date.strptime(date_string, "%m/%d/%Y")
      elsif date_string.match(/\d\d\.\d\d\.\d\d\d\d/)
        Date.strptime(date_string, "%d.%m.%Y")
      else
        Date.strptime(date_string, "%b %Y")
      end
    end
  end
end
