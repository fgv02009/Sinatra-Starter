# show all users (read)
get "/users" do
  @users = User.all
 
  erb :"users/index"
end
 
# show the form to create a new user
get "/users/new" do
  erb :"users/new"
end
 
# show one user by id (read)
get "/users/:id" do
  @user = User.find(params[:id])
 
  erb :"users/show"
end
 
# create a new user record (create)
post "/users" do
  @user = User.new(params[:user])
 
  if @user.save
    redirect "/users"
  else
    erb :"users/new"
  end
end
 
 
# Update
#
# show the form to edit a user
get "/users/:id/edit" do
  @user = User.find(params[:id])
 
  erb :"/users/edit"
end
 
# update the user by id (update)
put "/users/:id" do
  @user = User.find(params[:id])

  if @user.update(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"users/edit"
  end
end
 
 
# delete a user by id (destroy)
delete "/users/:id" do
  user = User.find(params[:id])
  user.delete
 
  redirect "/users"
end
