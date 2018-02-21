require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/tag.rb')
require_relative('./models/transactions.rb')
require_relative('./models/users.rb')

# index
get '/transactions' do
  @transactions = Transaction.all()
  @value = Transaction.transaction_total()
  @tag = Tag.all()
  erb(:index)
end

#create
post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end

# new
get '/transactions/new' do
  @tag = Tag.all()
  erb(:new)
end

#filter by tag
get '/transactions/tag' do
  @tag = Tag.all
  erb(:tag)
end

#filter results
post '/transactions/filter_results' do
  @transactions = Transaction.find_by_tag(params[:tag_id])
  @value = Transaction.transaction_total_by_tag(params[:tag_id])
  erb(:filter_results)
end

#show
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  @tag = @transaction.get_tag_name()
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
  @tag = Tag.all()
  erb(:edit)
end



#update
post '/transactions/:id' do
  @transactions = Transaction.new(params)
  @transactions.update()
  redirect to '/transactions'
end

#hoem page
get '/' do
  erb(:home)
end
