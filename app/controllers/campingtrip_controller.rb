class CampingtripController < ApplicationController

  get '/campingtrip/create_trip' do
    authenticate_user
    if session[:user_id]
      erb :'/campingtrip/create_trip'
    else
      redirect to '/login'
    end
  end

post '/campingtrip/create_trip' do
  authenticate_user
 @campingtrip = Campingtrip.create(park_name: params[:park_name], state: params[:state], site_number: params[:site_number],
 firepit: params[:firepit], waterfront: params[:waterfront], shaded: params[:shaded], dog_friendly: params[:dog_friendly],
 cabins: params[:cabins], toilet_type: params[:toilet_type], other_good_sites: params[:other_good_sites],
 waterpump: params[:waterpump], water_taste: params[:water_taste], added_notes: params[:added_notes])
 if @campingtrip.save && !current_user.campingtrips.include?(@campingtrip.park_name)
        current_user.campingtrips << @campingtrip
        # flash[:message] = "Successfully created trip"
        redirect to "/campingtrip/#{@campingtrip.id}"
      else
        redirect to '/campingtrip/create_trip'
      end
    end

    get '/campingtrip/:id' do
      authenticate_user
      if @campingtrip = current_user.campingtrips.find_by(id: params[:id])
        session[:campingtrip] = @campingtrip.id
        erb :'/campingtrip/show_trips'
      else
        flash[:message] = "Error: You cannot view another user's collection"
        redirect to "/users/#{current_user.slug}"
      end
    end


end
