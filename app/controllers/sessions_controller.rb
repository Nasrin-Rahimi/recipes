class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/sessions' do 
       login(params[:username], params[:password])
       redirect '/categories'
    end

    get '/logout' do
        logout!
        # redirect "/login"
        redirect "/"
    end

end