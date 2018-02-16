require_relative('../models/users.rb')
require_relative('../models/transactions.rb')
require('pry')

Transaction.delete_all
User.delete_all

user1 = User.new ({
  'name' => 'Danny',
  'budget' => 100.00
})

user1.save()

transaction1 = Transaction.new ({
  'merchant_name' => 'Tesco',
  'transaction_value' => 7.99,
  'transaction_tag' => 'groceries',
  'user_id' => user1.id
  })

transaction1.save()





binding.pry
nil
