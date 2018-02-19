require_relative('../models/users.rb')
require_relative('../models/transactions.rb')
require_relative('../models/tag.rb')


require('pry')

Transaction.delete_all
User.delete_all
Tag.delete_all


user1 = User.new ({
  'name' => 'Danny',
  'budget' => 100.00
})

user1.save()

tag1 = Tag.new ({
  'tag_name' => 'Groceries'
  })
tag2 = Tag.new ({
  'tag_name' => 'Wardobe'
  })
tag3 = Tag.new ({
  'tag_name' => 'Bills'
  })
tag4 = Tag.new ({
  'tag_name' => 'Travel'
  })
tag5 = Tag.new ({
  'tag_name' => 'Entertainment'
  })
tag6 = Tag.new ({
  'tag_name' => 'Frivolous'
  })
tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()

transaction1 = Transaction.new({
  'merchant_name' => 'Tesco',
  'transaction_value' => 7.99,
  'tag_id' => tag1.id,
  })

transaction1.save()

transaction2 = Transaction.new({
  'merchant_name' => 'Beer Store',
  'transaction_value' => 16.99,
  'tag_id' => tag1.id,
  })
transaction2.save()

transaction3 = Transaction.new({
  'merchant_name' => 'ZARA',
  'transaction_value' => 59.95,
  'tag_id' => tag2.id,
  })

transaction3.save()

transaction4 = Transaction.new({
  'merchant_name' => 'Red Bubble',
  'transaction_value' => 19.99,
  'tag_id' => tag2.id,
  })
transaction4.save()

binding.pry
nil
