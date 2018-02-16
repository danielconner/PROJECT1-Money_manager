require_relative("../db/sql_runner.rb")

class Transaction

  attr_reader :id, :merchant_name, :transaction_value, :transaction_tag, :user_id

  def initialize( options )
    @id = options[:id].to_i()
    @merchant_name = options[:merchant_name]
    @transaction_value = options[:transaction_value].to_f()
    @transaction_tag = options[:transaction_tag]
    @user_id = options[:user_id].to_i()
  end

end
