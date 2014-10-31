require 'securerandom'

get '/' do
  @decks=Deck.all
  erb :home
end

get'/question/:id' do
  @deck = Deck.find(params[:id])
  p "%%%%%%%%%%%%%"
  questions_array=Deck.find(params[:id]).cards.to_a.shift
  p questions_array
  p Deck.find(params[:id]).cards
   @current_card = Deck.find(params[:id]).cards.to_a.shift


  @options = []
  3.times do
    @options << Card.all.sample
  end

  @options << @current_card

  erb :qu_home
end


post '/answer/:id' do

  chosen_id = params["chosen_answer"].keys.first
  current_card_id = params[:id]
  deck_id = params["deck_id"]

  @current_card = Card.find(current_card_id)
  @chosen_card = Card.find(chosen_id)

  @deck = Deck.find(params[:deck_id].to_i)

  # we need current card, and the chosen card id
  if @current_card.id == @chosen_card.id
    @check = true
  else
    @check = false
  end
  erb :qu_answer
end


#-------SESSIONS--------------------

get '/login' do
  erb :sign_in
end

post '/login' do
  # sign-in

  @user=User.new
  user_logging=@user.authenticate(params[:username],params[:password])
  if user_logging
    session[:username] = user_logging.username
    redirect '/'
  else
    #go back to signin
    redirect '/login'
  end
end

get '/logout' do
  session[:username] = nil
  redirect to '/'
end
#----------- USERS -----------

get '/users/new' do
  # @user = User.new
  erb :sign_up
end

post '/users' do
  username = params["username"]
  password = params["password"]
  @user = User.new
  new_user=@user.register(username, password)
  if new_user
  #if username #comment this out later
    session[:username] = new_user.username
    redirect  '/'
  else
    @errors = @user.errors
    erb :sign_up
  end
end

