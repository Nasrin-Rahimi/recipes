require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #turn sessions on
    set :session_secret, "my_best_recipes_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    
    def logged_in?
      !!session[:email]
    end

    def login(email)
      session[:email] = email
    end

    def logout!
      session.clear
      #Emailing them to let them know they logged out
    end

  end

end
