get '/post/:post_id/comment/new' do
  @user = User.find(session[:id])
  @post = Post.find(params[:post_id])
  @comments = Comments.all
  erb :"post/comment/new"
end

# create comment
post '/post/:post_id/comment/new' do
  @user = User.find(session[:id])
  @post = Post.find(params[:post_id])
  @comment = Comment.create(body: params["body"], user_id: @user.id, post_id: @post.id)
  redirect to("/post/#{@post.id}")
end

get '/post/:post_id/:comment_id/upvote' do
  @user = User.find(session[:id])
  @comment = Comment.find(params[:comment_id])
  @upvote = Commentvote.create(user_id: @user.id, comment_id: @comment.id)
  @post = Post.find(params[:post_id])
  @comments = @post.comments

   erb :"post/show"
end


