class LandsController < ApplicationController
    # Get all lands
 get '/lands' do
    Land.all.to_json
  end
  
  # Get a specific land
  get '/lands/:id' do
    Land.find(params[:id]).to_json
  end
  
  # Create a land
post '/lands' do
  name_ = params[:name]
  location_ = params[:location]
  value_ = params[:value]
  image_url = params[:image_url]
  user_id = params[:user_id]

  land = Land.create(name: name_, location: location_, value: value_, image_url: image_url, user_id: user_id)

  if land.save
    message = { success: "Land created" }
    status 201
  else
    message = { error: "Land creation failed" }
    status 422
  end

  message.to_json
end
  
  # Update a land
  put '/lands/:id' do
    land = Land.find(params[:id])
    if land.update(params)
      land.to_json
    else
      {error: "Failed to update land"}.to_json
    end
  end
  
  # Delete a land
  delete '/lands/:id' do
    land = Land.find(params[:id])
    if land.destroy
      {message: "Land deleted"}.to_json
    else
      {error: "Failed to delete land"}.to_json
    end
  end

end