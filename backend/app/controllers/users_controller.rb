class UsersController < ApplicationController

    # Get all users
  get '/users' do
    User.all.to_json
  end
  
  # Get a specific user
  get '/users/:id' do
    User.find(params[:id]).to_json
  end
  
  # Create a user
post '/users' do

  name_ = params[:name]
  user = User.create(name: name_)

  if user
    message = {:success => "User created"}
    message.to_json
  
  else
    message = {:error => "User creation failed"}
    message.to_json
  end

end
  
  # Update a user
  put '/users/:id' do
    user = User.find(params[:id])
    if user.update(params)
      user.to_json
    else
      {error: "Failed to update user"}.to_json
    end
  end
  
  # Delete a user
  delete '/users/:id' do
    user = User.find(params[:id])
    if user.destroy
      {message: "User deleted"}.to_json
    else
      {error: "Failed to delete user"}.to_json
    end
  end


end