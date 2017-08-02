# 💾🎈💰 ynab-ruby 💰🎈💾

This is a gem for reading data from [YNAB](ynab.com) CSV exports.

## Types of CSVs

When you export a budget from YNAB.com, you get two files:

* `budget.csv`, which contains details of monthly, per-category budget goals
* `register.csv`, which contains transactions and their metadata (accounts, 
budget categories, memos, etc).

## Usage

### Importing a register

```ruby
register = Register.new("test/fixtures/register.csv")
=> #<Register:0x007fd7e10ae838 @csv_path="test/fixtures/register.csv", @transactions=nil>
register.transactions {|transaction| pp transaction}
```

## Local Development

`.pryrc` includes an import statement, so you can run `bundle exec pry` to noodle around with the code in console. 

