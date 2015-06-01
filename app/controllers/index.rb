enable :sessions

get '/' do
    erb :index
end

post '/sign_up' do
  @user = User.create(params["user"])
  @profile = Profile.create(first_name: params["profile"]["first_name"], last_name: params["profile"]["last_name"], user_id: @user.id)
  session[:id] = @user.id
  redirect to("/feed")
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params["user"]["email"], params["user"]["password"])

  if @user
    session[:id] = @user.id
    redirect to("/feed")
  else
    redirect to("/login")
  end
end

get '/feed' do
  if session[:id].nil?
    redirect to("/")
  else
    @user = User.where(id: session[:id]).first
    @statuses = Status.all
    @tags = Tag.all
  end
    erb :feed
end

get '/logout' do
  session[:id] = nil
  redirect to '/'
end