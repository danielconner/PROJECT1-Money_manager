require_relative("../db/sql_runner.rb")

class Users

  attr_reader :user_name, :budget, :id

  def initialize( options )
    @id = options[:id].to_i()
    @user_name = options [:user_name]
    @budget = options [:budget].to_f()
  end



end
