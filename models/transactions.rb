require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id, :merchant_name, :transaction_value, :transaction_tag, :user_id

  def initialize( options )
    @id = options['id'].to_i()
    @merchant_name = options['merchant_name']
    @transaction_value = options['transaction_value'].to_f()
    @transaction_tag = options['transaction_tag']
    @user_id = options['user_id'].to_i()
  end
  # now time to make save method and find all method for CRUD
  def save()
    sql = "INSERT INTO transactions (merchant_name, transaction_value, transaction_tag, user_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_name, @transaction_value, @transaction_tag, @user_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all
    sql ="SELECT * From transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map{|transaction| Transaction.new(transaction)}
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def update
    sql ="UPDATE transactions SET (merchant_name, transaction_value, transaction_tag, user_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_name, @transaction_value, @transaction_tag, @user_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run( sql, values )
    result = Transaction.new( transactions.first )
    return result
  end



end
