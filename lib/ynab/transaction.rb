class Transaction
  attr_reader :account
  attr_reader :flag
  attr_reader :date
  attr_reader :payee
  attr_reader :category_group_and_category
  attr_reader :category_group
  attr_reader :category
  attr_reader :memo
  attr_reader :outflow
  attr_reader :inflow
  attr_reader :cleared

  def initialize(attr_hash)
    @account = attr_hash[:account]
    @flag = attr_hash[:flag]
    @date = attr_hash[:date]
    @payee = attr_hash[:payee]
    @category_group_and_category = attr_hash[:category_group_and_category]
    @category_group = attr_hash[:category_group]
    @category = attr_hash[:category]
    @memo = attr_hash[:memo]
    @outflow = CurrencyConverter.new(attr_hash[:outflow]).to_cents
    @inflow = CurrencyConverter.new(attr_hash[:inflow]).to_cents
    @cleared = attr_hash[:cleared]
  end
end
