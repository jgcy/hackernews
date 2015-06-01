get '/status/:status_id/comment/new' do
  @user = User.find(session[:id])
  @status = Status.find(params[:status_id])
  @comments = Comment.all
  erb :"status/comment/new"
end

# create comment
post '/status/:status_id/comment/new' do
  @user = User.find(session[:id])
  @status = Status.find(params[:status_id])
  @comment = Comment.create(comment_body: params["comment_body"], user_id: @user.id, status_id: @status.id)
  redirect to("/status/#{@status.id}")
end

# edit comment
get '/status/:status_id/comment/:comment_id/edit' do
  @status = Status.where(id: params[:status_id]).first
  @comment = Comment.where(id: params[:comment_id]).first
  erb :"status/comment/edit"
end

# update comment
put '/status/:status_id/comment/:comment_id' do
  @status = Status.where(id: params[:status_id]).first
  @comment = Comment.where(id: params[:comment_id]).first
  @comment.update_attributes(comment_body: params["comment_body"])
  redirect to("/status/#{@status.id}")
end

# delete comment
get '/status/:status_id/comment/:comment_id/delete' do
  @comment = Comment.where(id: params[:comment_id]).first
  @comment.destroy
  @status = Status.where(id: params[:status_id]).first
  redirect to("/status/#{@status.id}")
end