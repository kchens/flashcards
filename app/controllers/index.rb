get '/' do
  @decks=Deck.all
  erb :home
end

get'/'

#-------SESSIONS--------------------

get '/login' do
  erb :sign_in
end

post '/register' do
  # sign-in
  @user=User.find(params[:username])
  if @user.password == params[:password]
    #set the session
    session[:user_id] = @user.id
    redirect '/'
  else
    #go back to signin
    redirect '/register'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:user_id] = nil
  redirect '/'
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