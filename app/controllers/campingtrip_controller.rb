class CampingtripController < ApplicationController

  get '/campingtrip/create_trip' do
    if session[:user_id]
      erb :'/campingtrip/create_trip'
    else
      redirect to '/login'
    end
  end

  post '/campingtrip/create_trip' do
    @campingtrip = CampingTrip.create(params)
    @campingtrip.save
    redirect to "/user/#{@campground.id}"
  end
end
