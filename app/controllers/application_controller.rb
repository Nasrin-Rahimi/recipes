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

    def login(email, password)
      #check if a user with this email exist and check password
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
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
