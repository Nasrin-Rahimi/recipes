require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #turn sessions on
    set :session_secret, "my_best_recipes_secret"
  end

  get "/" do
    @categories = Category.all
    erb :home
  end

  helpers do
    
    def logged_in?
      !!session[:username]
    end

    def login(username, password)
      #check if a user with this username exist and check password
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
      #Emailing them to let them know they logged out
    end

  end

end
