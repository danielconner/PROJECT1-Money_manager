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

  def self.delete_all
    sql = "DELETE FROM transaction_tags"
    SqlRunner.run(sql)
  end


end
