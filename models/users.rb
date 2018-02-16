require_relative("../db/sql_runner.rb")

class User

  attr_reader :name, :budget, :id

  def initialize( options )
    @id = options['id'].to_i()
    @name = options['name']
    @budget = options['budget'].to_f()
  end
  # now time to make a save method for CRUD
  def save()
    sql = "INSERT INTO users (name, budget) VALUES ($1, $2) RETURNING id"
    values = [@name, @budget]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all
    sql ="SELECT * From users"
    users = SqlRunner.run(sql)
    return users.map{|user| User.new(user)}
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  

end
