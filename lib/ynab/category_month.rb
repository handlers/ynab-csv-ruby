class CategoryMonth
  attr_reader :month
  attr_reader :category_group_and_category
  attr_reader :category_group
  attr_reader :category
  attr_reader :budgeted
  attr_reader :activity
  attr_reader :available

  def initialize(attr_hash)
    @month = attr_hash[:month]
    @category_group_and_category = attr_hash[:category_group_and_category]
    @category_group = attr_hash[:category_group]
    @category = attr_hash[:category]
    @budgeted = attr_hash[:budgeted]
    @activity = attr_hash[:activity]
    @available = attr_hash[:available]
  end
end
