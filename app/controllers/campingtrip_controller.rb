class CampingtripController < ApplicationController

  get '/campingtrip/create_trip' do
    if session[:user_id]
      erb :'/campingtrip/create_trip'
    else
      redirect to '/login'
    end
  end
  
  # post '/campingtrip/create_trip' do
  #     @campingtrip = CampingTrip.new(params)
  #     if @campingtrip.save && !user_campingtrip.include?(@campingtrip.name)
  #       current_user.campingtrip << @campingtrip
  #       flash[:message] = "Successfully created trip"
  #       redirect to "/campingtrip/#{@campingtrip.id}"
  #     else
  #       redirect to '/campingtrip/create_trip'
  #     end
  #   end
end
