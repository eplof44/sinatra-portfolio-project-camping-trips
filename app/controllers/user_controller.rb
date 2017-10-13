class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/users/login'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect to '/login'
  end

  # get '/users/:slug' do
  #   @user = User.find_by_slug(params[:slug])
  #   if current_user == @user
  #     erb :'/users/show'
  #   else
  #     redirect to "/users/#{current_user.slug}"
  #   end
  # end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end


end
