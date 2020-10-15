class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do 
       session[:email] = params[:email]
       redirect '/recipes'
    end

    get '/logout' do
        session.clear
        redirect "/login"
    end

end