class CampingtripController < ApplicationController

  get '/campingtrip/create_trip' do
     if logged_in?
      @user = current_user
      erb :'/campingtrip/create_trip'
     else
      redirect "/login"
    end
   end


  post '/trips' do
      @user = current_user
      if params[:park_name] == ""
       redirect "/campingtrip/create_trip"
      else
      @campingtrip = Campingtrip.create(park_name: params[:park_name], state: params[:state], site_number: params[:site_number],
      firepit: params[:firepit], waterfront: params[:waterfront], shaded: params[:shaded], dog_friendly: params[:dog_friendly],
      cabins: params[:cabins], toilet_type: params[:toilet_type], other_good_sites: params[:other_good_sites],
      waterpump: params[:waterpump], water_taste: params[:water_taste], added_notes: params[:added_notes])

       @campingtrip.user_id = @user.id
       @campingtrip.save
       redirect "/campingtrip/#{@campingtrip.id}"
      end
  end

  get '/trips' do
    if logged_in?
     @user = current_user
     @campingtrip = Campingtrip.all
     erb :'/campingtrip/trips'
    else
     redirect "/login"
    end
  end

  get '/campingtrip/:id'do
     if logged_in?
      @campingtrip = Campingtrip.find(params[:id])
      erb :'campingtrip/show_trips'
     else
      redirect "/login"
     end
  end

  post '/campingtrip/:id/edit' do
   @campingtrip = Campingtrip.find(params[:id])
   if logged_in? && @campingtrip.user_id == current_user.id
    erb :'campingtrip/edit_trip'
   else
    redirect "/login"
   end
  end

  patch '/campingtrip/:id' do
    @campingtrip = Campingtrip.find(params[:id])
     if params[:park_name] == ""
      redirect "/campingtrip/#{params[:id]}/edit"
     else
      @campingtrip.update(park_name: params[:park_name], state: params[:state], site_number: params[:site_number],
      firepit: params[:firepit], waterfront: params[:waterfront], shaded: params[:shaded], dog_friendly: params[:dog_friendly],
      cabins: params[:cabins], toilet_type: params[:toilet_type], other_good_sites: params[:other_good_sites],
      waterpump: params[:waterpump], water_taste: params[:water_taste], added_notes: params[:added_notes])
      redirect "/campingtrip/#{params[:id]}"
     end
  end

  delete '/campingtrip/:id/delete' do
    @campingtrip = Campingtrip.find(params[:id])
    @user = current_user
    if logged_in? && @campingtrip.user_id == @user.id
     @campingtrip.delete
     erb :'/campingtrip/delete'
    else
     redirect "/login"
    end
  end




end
















#     get '/trips' do
#       if logged_in?
#         @user = User.find(session[:user_id])
#         @campingtrip = Campingtrip.all
#         erb :'campingtrip/trips'
#       else
#         redirect to '/login'
#       end
#   end
#
#
#
#   get '/campingtrip/create_trip' do
#     authenticate_user
#     if session[:user_id]
#       erb :'/campingtrip/create_trip'
#     else
#       redirect to '/login'
#     end
#   end
#
# post '/campingtrip/create_trip' do
#   authenticate_user
#  @campingtrip = Campingtrip.create(park_name: params[:park_name], state: params[:state], site_number: params[:site_number],
#  firepit: params[:firepit], waterfront: params[:waterfront], shaded: params[:shaded], dog_friendly: params[:dog_friendly],
#  cabins: params[:cabins], toilet_type: params[:toilet_type], other_good_sites: params[:other_good_sites],
#  waterpump: params[:waterpump], water_taste: params[:water_taste], added_notes: params[:added_notes])
#  if @campingtrip.save && !current_user.campingtrips.include?(@campingtrip.park_name)
#         current_user.campingtrips << @campingtrip
#         redirect to "/campingtrip/#{@campingtrip.id}"
#       else
#         redirect to '/campingtrip/create_trip'
#       end
#     end
#
#     get '/campingtrip/:id' do
#       authenticate_user
#       if @campingtrip = current_user.campingtrips.find_by(id: params[:id])
#         session[:campingtrip] = @campingtrip.id
#         erb :'/campingtrip/show_trips'
#       else
#         redirect to "/users/#{current_user.slug}"
#       end
#     end
#
#     patch '/campingtrip/:id' do
#        authenticate_user
#        @campingtrip = Campingtrip.find(params[:id])
#        if !params[:campingtrip][:site_name].empty?
#          @campingtrip.park_name = params[:campingtrip][:park_name]
#          @collection.save
#        end
#
#        redirect to "/campingtrip/#{@campingtrip.id}"
#      end
#
#      get '/campingtrip/:id/edit' do
#        authenticate_user
#        @campingtrip = Campingtrip.find(params[:id])
#        if current_user.campingtrip_ids.include?(@campingtrip.id)
#          session[:campingtrip] = @campingtrip.id
#          erb :'/campingtrip/edit_trip'
#        else
#          redirect to "/users/#{current_user.slug}"
#        end
#      end
#
#      post '/campingtrip/:id/delete' do
#     @campingtrip= Campingtrip.find(params[:id])
#     @user = current_user
#     if logged_in? && @campingtrip.user_id == @user.id
#      @campingtrip.delete
#      erb :'campingtrip/delete'
#     else
#      redirect "/login"
#     end
#    end
#
#
# end
