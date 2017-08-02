require "csv"

class Register
  def initialize(path_to_csv)
    @csv_path = path_to_csv
    @transactions = nil
  end

  # Returns an Array of transaction objects from the input CSV
  #
  # @return [Array<Transaction>] an array of <Transaction> objects.
  def transactions
    @transactions ||= cast_csv_to_transactions 
  end

  private

  # Converts the input CSV to an array of <Transaction> objects.
  #
  # @return [Array<Transaction>] an array of <Transaction> objects.
  def cast_csv_to_transactions
    transactions = []

    CSV.foreach(@csv_path, headers: true) do |row|
      transaction_attributes =
        TransactionDeserializer.new(row).to_transaction_hash
      transactions.push(Transaction.new(transaction_attributes))
    end

    transactions
  end
end