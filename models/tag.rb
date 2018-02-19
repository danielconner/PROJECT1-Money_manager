require_relative("../db/sql_runner.rb")

class Tag

  attr_reader :id, :tag_name

  def initialize( options )
    @id = options['id'].to_i
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO tags (tag_name) VALUES ($1)
    RETURNING id"
    values = [@tag_name]
    @id =SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update
    sql ="UPDATE tags SET (tag_name) = ($1) WHERE id = $2"
    values = [@tag_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.all
    sql ="SELECT * From tags"
    transactions = SqlRunner.run(sql)
    return transactions.map{|transaction| Tag.new(transaction)}
  end

  def self.find( id )
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run( sql, values )
    result = Tag.new( transactions.first )
    return result
  end

end
