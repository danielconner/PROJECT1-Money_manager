require_relative('../models/users.rb')
require_relative('../models/transactions.rb')
require_relative('../models/transaction_tag.rb')


require('pry')

Transaction.delete_all
User.delete_all
TransactionTag.delete_all


user1 = User.new ({
  'name' => 'Danny',
  'budget' => 100.00
})

user1.save()

transaction_tag1 = TransactionTag.new ({
  'tag_name' => 'food'
  })
transaction_tag2 = TransactionTag.new ({
  'tag_name' => 'clothes'
  })
transaction_tag1.save()
transaction_tag2.save()

transaction1 = Transaction.new ({
  'merchant_name' => 'Tesco',
  'transaction_value' => 7.99,
  'transaction_tag' => transaction_tag1.id,
  'user_id' => user1.id
  })

transaction1.save()

transaction2 = Transaction.new ({
  'merchant_name' => 'Beer Store',
  'transaction_value' => 16.99,
  'transaction_tag' => transaction_tag1.id,
  'user_id' => user1.id
  })
transaction2.save()

transaction3 = Transaction.new ({
  'merchant_name' => 'ZARA',
  'transaction_value' => 59.95,
  'transaction_tag' => transaction_tag2.id,
  'user_id' => user1.id
  })

transaction3.save()

transaction4 = Transaction.new ({
  'merchant_name' => 'Red Bubble',
  'transaction_value' => 19.99,
  'transaction_tag' => transaction_tag2.id,
  'user_id' => user1.id
  })
transaction4.save()

binding.pry
nil
