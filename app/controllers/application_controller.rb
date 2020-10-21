require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #turn sessions on
    set :session_secret, "my_best_recipes_secret"
  end

  get "/" do
    @categories = Category.all
    # flash[:notice] = "Hooray, Flash is working!"
    erb :home
  end

  helpers do
    
    def logged_in?
      # !!session[:username]
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

    def authentication_required
      if !logged_in?
        flash[:notice] = "You must be logged in."
        redirect '/login'
      end
    end

  end

end
