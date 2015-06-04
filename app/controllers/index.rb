enable :sessions

def logged_in?
  if session[:id] == nil
    false
  else
    true
  end
end

def username
  @user = User.find(session[:id])
  @user.username
end

get '/' do
  #show all post
  @posts = Post.all
  if session[:id]
    @user = User.find(session[:id])
  else
    @user = nil
  end
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params["user"]["username"], params["user"]["password"])

  if @user
    session[:id] = @user.id
    redirect to("/")
  else
    redirect to("/login")
  end
end

post '/sign_up' do
  @user = User.create(params["user"])
  session[:id] = @user.id
  redirect to("/")
end

get '/logout' do
  session[:id] = nil
  redirect to '/'
end

