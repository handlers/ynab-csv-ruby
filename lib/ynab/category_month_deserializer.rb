class CategoryMonthDeserializer
  attr_accessor :row_hash

  def initialize(row_hash)
    @row_hash = row_hash
  end

  # Takes in a row hash from the CSV and returns a hash that can be passed into
  #   CategoryMonth.new to create an instance.
  #
  # @return [Hash] a hash to be passed to CategoryMonth.new.
  def to_category_month_hash
    {
      month: row_hash["Month"],
      category_group_and_category: row_hash["Category Group/Category"],
      category_group: row_hash["Category Group"],
      category: row_hash["Category"],
      budgeted: row_hash["Budgeted"],
      activity: row_hash["Activity"],
      available: row_hash["Available"]
    }
  end
end
