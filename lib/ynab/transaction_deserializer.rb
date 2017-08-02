class TransactionDeserializer
  attr_accessor :row_hash

  def initialize(row_hash)
    @row_hash = row_hash
  end

  # Takes in a row hash from the CSV and returns a hash that can be passed into
  #   Transaction.new to create an instance.
  #
  # @return [Hash] a hash to be passed to Transaction.new.
  def to_transaction_hash
    {
      account: row_hash["Account"],
      flag: row_hash["Flag"],
      date: DateConverter.new(row_hash["Date"]).to_date,
      payee: row_hash["Payee"],
      category_group_and_category: row_hash["Category Group/Category"],
      category_group: row_hash["Category Group"],
      category: row_hash["Category"],
      memo: row_hash["Memo"],
      outflow: row_hash["Outflow"],
      inflow: row_hash["Inflow"],
      cleared: row_hash["Cleared"] == "Cleared"
    }
  end
end
