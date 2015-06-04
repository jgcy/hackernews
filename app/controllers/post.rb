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

post '/post/:post_id/upvote' do
  @user = User.find(session[:id])
  @post = Post.find(params[:post_id])
  @vote = Postvote.vote_only_once(@user.id, @post.id)
  if @vote
    @upvote = Postvote.create(user_id: @user.id, post_id: @post.id)
  end
  @posts = Post.all
  # @posts.to_json
  {post: @post, count: @post.postvotes.count}.to_json
  # @post.to_json
  # erb :index
end

