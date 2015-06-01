# create new status
get '/status/new' do
  @user = User.where(id: session[:id])
  erb :"status/new"
end

post '/status/new' do
  @user = User.where(id: session[:id]).first
  @status = Status.create(status_body: params["status_body"], user_id: @user.id)
    if Tag.find_by_name(params["tag_name"]) != nil
      @tag = Tag.where(name: params["tag_name"])[0]
      @status_tag = StatusTag.create(status_id: @status.id, tag_id: @tag.id)
    else
      @tag = Tag.create(name: params["tag_name"])
      @status_tag = StatusTag.create(status_id: @status.id, tag_id: @tag.id)
    end
    redirect to("/status/#{@status.id}")
end


# show status
get '/status/:status_id' do
  @status = Status.find(params[:status_id])
  @comments = Comment.all
  erb :"status/show"
end


# edit status
get '/status/:status_id/edit' do
  @status = Status.where(id: params[:status_id]).first
  erb :"status/edit"
end

# update status
put '/status/:status_id' do
  @status = Status.where(id: params[:status_id]).first
  @status.update_attributes(status_body: params["status_body"])
  redirect to("/status/#{@status.id}")
end

# delete status
get '/status/:status_id/delete' do
  @status = Status.where(id: params[:status_id]).first
  @status.destroy
  redirect to("/feed")
end

# show all statuses with same tag
get '/tag/:tag_id' do
  @tag = Tag.where(id: params[:tag_id]).first
  erb :tag
end

