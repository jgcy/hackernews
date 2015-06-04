# show user profile
get '/user/:user_id' do
  if session[:id].nil?
    redirect to("/")
  else
    @user = User.where(id: params[:user_id]).first
    erb :"user/show"
  end
end

# show posts
get '/user/:user_id/posts' do
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :"user/userposts"
end

# show comments
get '/user/:user_id/comments' do
  @user = User.find(params[:user_id])
  @comments = Comment.where(user_id: params[:user_id])
  erb :"user/usercomments"
end