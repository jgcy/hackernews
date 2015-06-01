# create new status
get '/status/new' do
  @user = User.where(id: session[:id])
  erb :"status/new"
end

post '/status/new' do
  @user = User.where(id: session[:id]).first
  @status = Status.create(status_body: params["status_body"], user_id: @user.id)

  tag_array = params["tag"]["name"].split(", ")
  tag_array.each do |tag|
    if Tag.where(name: tag).present?
      @status_tag = StatusTag.create(status_id: @status.id, tag_id: tag.id)
      byebug
    else
      new_tag = Tag.create(name: tag, status_id: @status.id)
      @status_tag = StatusTag.create(status_id: @status.id, tag_id: new_tag.id)
      byebug
    end
  redirect to("/status/#{@status.id}")
  end
end

# show status
get '/status/:status_id' do
  @status = Status.find(params[:status_id])
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

get '/tag/:tag_id' do
  erb :tag
end