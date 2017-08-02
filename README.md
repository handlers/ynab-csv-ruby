# 🎈💾💰 ynab-ruby 💰💾🎈

This is a (WIP) gem for reading data from [YNAB](ynab.com) CSV exports.

## Types of CSVs

When you export a budget from YNAB.com, you get two files:

* `budget.csv`, which contains details of monthly, per-category budget goals.
* `register.csv`, which contains transactions and their metadata (accounts, 
budget categories, memos, etc).

## Usage

### Importing a register

```ruby
[1] pry(main)> r  = Register.new("test/fixtures/register.csv")
=> #<Register:0x007f9ce53bb0a8 @csv_path="test/fixtures/register.csv", @transactions=nil>
[2] pry(main)> r.transactions {|transaction| pp transaction}
=> [#<Transaction:0x007f9ce52abc80
  @account="Checking",
  @category="Groceries",
  @category_group="Mandatory Expenses",
  @category_group_and_category="Mandatory Expenses: Groceries",
  @cleared=true,
  @date=#<Date: 2017-08-01 ((2457967j,0s,0n),+0s,2299161j)>,
  @flag="",
  @inflow=0,
  @memo="Chicken a la king ingredients",
  @outflow=2105,
  @payee="Groceries, Inc.">,
 #<Transaction:0x007f9ce52a8be8
  @account="Savings",
  @category="To be Budgeted",
  @category_group="Inflow",
  @category_group_and_category="Inflow: To be Budgeted",
  @cleared=true,
  @date=#<Date: 2017-08-01 ((2457967j,0s,0n),+0s,2299161j)>,
  @flag="",
  @inflow=7500,
  @memo="Birthday Present from Uncle Herb",
  @outflow=0,
  @payee="Uncle Herb">]
```

## Local Development

`.pryrc` includes an import statement, so you can run `bundle exec pry` to noodle around with the code in console. 

