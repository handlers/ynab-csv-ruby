require "csv"

class Budget
  def initialize(path_to_csv)
    @csv_path = path_to_csv
    @category_months = nil
  end

  # Returns an Array of category month objects from the input CSV
  #
  # @return [Array<CategoryMonth>] an array of <CategoryMonth> objects.
  def category_months
    @category_months ||= cast_csv_to_category_months
  end

  private

  # Converts the input CSV to an array of <CategoryMonth> objects.
  #
  # @return [Array<CategoryMonth>] an array of <CategoryMonth> objects.
  def cast_csv_to_category_months
    category_months = []

    CSV.foreach(@csv_path, headers: true) do |row|
      category_month_attributes =
        CategoryMonthDeserializer.new(row).to_category_month_hash
      category_months.push(CategoryMonth.new(category_month_attributes))
    end

    category_months
  end
end