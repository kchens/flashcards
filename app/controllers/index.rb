require 'securerandom'

get '/' do
  @decks=Deck.all
  erb :home
end

get'/question/:id' do
  # @question=Card.find(params[:id]).questions
  @deck = Deck.find(params[:deck].to_i).cards.to_a.shuffle
  #4 answers passed to the erb
  @wrong_answers = []
  3.times do
    @wrong_answers << Card.find(rand(10)).answer
  end
  @right_answer=
  erb :qu_home
end

post '/question/:id' do
 @question = Card.find(params[:id]).questions
 # @answer =
 erb :qu_answer
end

#-------SESSIONS--------------------

get '/login' do
  erb :sign_in
end

post '/login' do
  # sign-in
  @user=User.find(username: params[:username])
  if @user.password == params[:password]
    #set the session
    session[:user_id] = @user.id
    redirect '/'
  else
    #go back to signin
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
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

