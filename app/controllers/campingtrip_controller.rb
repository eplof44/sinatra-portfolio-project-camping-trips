class CampingtripController < ApplicationController

  get '/campingtrip/new' do
    if session[:user_id]
      erb :'/campingtrip/create_trip'
    else
      redirect to '/login'
    end
  end

  post '/campingtrip/new' do
    @campingtrip = CampingTrip.create(params)
    @campingtrip.save
    redirect to "/user/#{@campground.id}"
  end
end
