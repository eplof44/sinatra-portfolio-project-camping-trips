class CampingtripController < ApplicationController

  get '/campingtrip/new' do
    if session[:user_id]
      erb :'/campingtrip/create_trip'
    else
      redirect to '/login'
    end
  end


end
