module YnabCsv
  class CurrencyConverter
    def initialize(currency_string)
      @currency_string = currency_string
    end

    # Converts input currency string (in dollars) into an integer representing its
    #   value in cents
    #
    # @return [Integer]
    def to_cents
      (100 * @currency_string.gsub("$", "").to_r).to_i
    end
  end
end
