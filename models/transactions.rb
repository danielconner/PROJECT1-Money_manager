require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id, :merchant_name, :transaction_value, :tag_id

  def initialize( options )
    @id = options['id'].to_i()
    @merchant_name = options['merchant_name']
    @transaction_value = options['transaction_value'].to_f()
    @tag_id = options['tag_id'].to_i
  end
  # now time to make save method and find all method for CRUD
  def save()
    sql = "INSERT INTO transactions (merchant_name, transaction_value, tag_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@merchant_name, @transaction_value, @tag_id]
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
    sql ="UPDATE transactions SET (merchant_name, transaction_value, tag_id) = ($1, $2, $3) WHERE id = $4"
    values = [@merchant_name, @transaction_value, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete( id )
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run( sql, values )
    result = Transaction.new( transactions.first )
    return result
  end

  # cannot get this to work, its mapping out a new instance of my class with nil in everything but the transaction value but i can get the transaction value to sum!!! solved

  def self.transaction_total()
    sql = "SELECT SUM(transaction_value) FROM TRANSACTIONS "
    return SqlRunner.run(sql).first[:sum.to_s].to_f()
  end

  def self.transaction_total_by_tag(tag_id)
    sql = "SELECT SUM(transaction_value) FROM TRANSACTIONS INNER JOIN tags ON transactions.tag_id = tags.id WHERE tags.id = $1"
    values = [tag_id]
    return SqlRunner.run(sql, values).first[:sum.to_s].to_f()
  end

  # write a functions which returns the tag of an transaction based on its tag id

  def get_tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    tags = SqlRunner.run(sql, values)
    return tags.map{|tag| Tag.new(tag)}
  end

  def get_tag_name()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    return SqlRunner.run(sql, values).first[:tag_name.to_s]

  end

  def self.find_by_tag(tag_id)
    sql = "SELECT * FROM transactions INNER JOIN tags ON transactions.tag_id = tags.id WHERE tags.id = $1"
    values = [tag_id]
    tags = SqlRunner.run(sql, values)
    return tags.map{|tag| Transaction.new(tag)}
  end

  

end
