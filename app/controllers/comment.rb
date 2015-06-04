get '/post/:post_id/comment/new' do
  @user = User.find(session[:id])
  @post = Post.find(params[:post_id])
  @comments = Comment.all
  erb :"post/comment/new"
end

# create comment
post '/post/:post_id/comment/new' do
  @user = User.find(session[:id])
  @post = Post.find(params[:post_id])
  @comment = Comment.create(body: params["body"], user_id: @user.id, post_id: @post.id)
  redirect to("/post/#{@post.id}")
end