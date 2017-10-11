class UserController < ApplicationController

  get '/signup' do
    if session[:user_id]
      "/users/show"
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if !params[:username].empty? && !params[:email].empty? && @user.save
      session[:user_id] = @user.id
      redirect '/users/show'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if session[:user_id]
      redirect to :'/users/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users/show'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if session[:user_id]
      session.clear
      redirect '/login'
    else
      redirect to '/'
    end
  end
end
