require 'securerandom'

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
  username = params["username"]
  password = params["password"]
  @user = User.new
  # if @user.register(username, password)
  if username #comment this out later
    session[:username] = @user.username
    redirect  '/'
  else
    @errors = @user.errors
    erb :sign_up
  end
end

#----------- Login -----------

get '/login' do
  erb :sign_in
end

post '/login' do
  #ariana has good stuff
end