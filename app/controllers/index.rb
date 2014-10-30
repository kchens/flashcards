get '/' do
  @decks=Deck.all
  erb :home
end

#----------- USERS -----------

get '/users/new' do
  @user = User.new
  erb :sign_up
end

post '/users' do
  @user=User.new(params[:user])
  if @user.save
    redirect  '/'
  else
    @errors = @user.errors
    erb :sign_up
  end
end