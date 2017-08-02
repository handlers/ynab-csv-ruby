# 🎈💾💰 ynab-ruby 💰💾🎈

This is a (WIP) gem for reading data from [YNAB](ynab.com) CSV exports.

## Types of CSVs

When you export a budget from YNAB.com, you get two files:

* `budget.csv`, which contains details of monthly, per-category budget goals.
* `register.csv`, which contains transactions and their metadata (accounts,
budget categories, memos, etc).

## Usage

### Importing a register

The rows of a YNAB register CSV contain data on every individual transaction in
any account/card connected to your YNAB login. The register is read in and
parsed into Transaction objects. Outflow and inflow (how much you spent or made)
are represented in cents.

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
  ...]
```

### Importing a budget

The rows of a YNAB budget CSV contain data on how much money is being allocated
and spent per month per category. This gem represents category activity during
a month as a `CategoryMonth` object. Activity/available/budgeted are stored as
number of centscents. You import a CSV and interact with it as follows:

```ruby
[1] pry(main)> b = Budget.new("test/fixtures/budget.csv")
=> #<Budget:0x007fdb65806ec8 @category_months=nil, @csv_path="test/fixtures/budget.csv">
[2] pry(main)> b.category_months
=> [#<CategoryMonth:0x007fdb654c6948
  @activity=-7047,
  @available=0,
  @budgeted=7047,
  @category="Cell",
  @category_group="Immediate Obligations",
  @category_group_and_category="Immediate Obligations: Cell",
  @month=#<Date: 2016-12-01 ((2457724j,0s,0n),+0s,2299161j)>>,
  ...]
```

## Local Development

`.pryrc` includes an import statement, so you can run `bundle exec pry` to noodle around with the code in console.

