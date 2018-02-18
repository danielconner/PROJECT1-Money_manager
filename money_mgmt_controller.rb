require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/transaction_tag.rb')
require_relative('./models/transactions.rb')
require_relative('./models/users.rb')

# index
get '' do

  erb(:index)
end

#create
post '/' do

  erb(:create)
end

# new
get '' do
  erb(:new)
end

#show
get '' do

  erb(:show)
end


#destroy
post '' do

  erb(:delete)
end

#edit
get '' do

  erb(:edit)
end

#update
post '' do
  
end
