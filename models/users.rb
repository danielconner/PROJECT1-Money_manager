require_relative("../db/sql_runner.rb")

class User

  # if i get time going to try and add a user so on the home page it welcomes the user and shows budget

  # struggling with time this is a could and not should so will not be completed till after submission

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

  def update
    sql ="UPDATE users SET (name, budget) = ($1, $2) WHERE id = $3"
    values = [@name, @budget, @id]
    SqlRunner.run(sql, values)
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

  def self.find( id )
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    users = SqlRunner.run( sql, values )
    result = User.new( users.first )
    return result
  end

  def delete()
    sql = "DELETE FROM users
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def remaining_budget
    budget = @budget
    spend = Transaction.transaction_total
    amount = budget - spend
    return amount
  end

  def over_budget
    return @remaining_budget < 0
  end

  end
