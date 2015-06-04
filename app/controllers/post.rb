# create new status
get '/post/new' do
  @user = User.where(id: session[:id])
  erb :"post/new"
end

post '/post/new' do
  @user = User.where(id: session[:id]).first

  @post = Post.create(title: params["post"]["title"], link: params["post"]["link"], user_id: @user.id)
    redirect to("/post/#{@post.id}")
end


# show post
get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  erb :"post/show"
end