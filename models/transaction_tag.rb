require_relative("../db/sql_runner.rb")

class TransactionTag

  attr_reader :id, :tag_name

  def initialize( options )
    @id = options['id'].to_i
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO transaction_tags (tag_name) VALUES ($1)
    RETURNING id"
    values = [@tag_name]
    @id =SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update
    sql ="UPDATE transaction_tags SET (tag_name) = ($1) WHERE id = $2"
    values = [@tag_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transaction_tags"
    SqlRunner.run(sql)
  end

  def self.all
    sql ="SELECT * From transaction_tags"
    transactions = SqlRunner.run(sql)
    return transactions.map{|transaction| TransactionTag.new(transaction)}
  end

  def self.find( id )
    sql = "SELECT * FROM transaction_tags WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run( sql, values )
    result = TransactionTag.new( transactions.first )
    return result
  end

end
