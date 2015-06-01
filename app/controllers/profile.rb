# show profile
get '/profile/:user_id' do
  if session[:id].nil?
    redirect to("/")
  else
    @user = User.where(id: params[:user_id]).first
    @profile = Profile.where(user_id: params[:user_id]).first
    erb :"profile/show"
  end
end

# edit profile
get '/profile/:user_id/edit' do
  @user = User.find(params[:user_id])
  @profile = Profile.where(user_id: params[:user_id]).first
  erb :"profile/edit"
end

# update profile
put '/profile/:user_id' do
  @user = User.find(params[:user_id])
  @profile = Profile.where(user_id: params[:user_id]).first
  @profile.update_attributes(params["profile"])
  redirect to("/profile/#{@user.id}")
end

# delete profile
get '/profile/:user_id/delete' do
  @user = User.find(params[:user_id])
  @profile = Profile.where(user_id: params[:user_id]).first
  @user.destroy
  @profile.destroy
  redirect to("/")
end