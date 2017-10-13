require './config/environment'

class ApplicationController < Sinatra::Base
  # use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end

  def authenticate_user
    if !logged_in?
      # flash[:message] = "Error: You must be logged in to do that"
      redirect to "/login"
    end
  end

end
