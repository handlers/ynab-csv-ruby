module YnabCsv
  class CategoryMonth
    attr_reader :month
    attr_reader :category_group_and_category
    attr_reader :category_group
    attr_reader :category
    attr_reader :budgeted
    attr_reader :activity
    attr_reader :available

    def initialize(attr_hash)
      @month = DateConverter.new(attr_hash[:month]).to_date
      @category_group_and_category = attr_hash[:category_group_and_category]
      @category_group = attr_hash[:category_group]
      @category = attr_hash[:category]
      @budgeted = CurrencyConverter.new(attr_hash[:budgeted]).to_cents
      @activity = CurrencyConverter.new(attr_hash[:activity]).to_cents
      @available = CurrencyConverter.new(attr_hash[:available]).to_cents
    end
  end
end
