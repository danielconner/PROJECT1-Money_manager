require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/transaction_tag.rb')
require_relative('./models/transactions.rb')
require_relative('./models/users.rb')

# index
get '/transactions' do
  @transactions = Transaction.all()
  @value = Transaction.transaction_total()
  @tags = TransactionTag.all()
  # @tag = i want to get the info from the transaction tab table!!
  erb(:index)
end

#create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:create)
end

# new
get '/transactions/new' do
  @tag = TransactionTag.all()
  erb(:new)
end

#show
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:show)
end


#destroy
post '/transactions/:id/delete' do
  @transactions = Transaction.delete(params[:id])
  redirect to '/transactions'
end

#edit
get '/transactions/:id/edit' do
  @transactions = Transaction.find(params[:id])
  @tag = TransactionTag.all()

  erb(:edit)
end

#update
post '/transactions/:id' do
  @transactions = Transactions.new(params)
  @transactions.update()
  redirect to '/transactions'
end
