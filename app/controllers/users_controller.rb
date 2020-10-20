class UsersController < ApplicationController

    get '/signup' do
        erb :"/users/signup"
    end

    post '/signup' do
        #check user fields validation, if fields are not valid, stay in signup page!
        user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        redirect '/login'
    end

    get '/login' do
        erb :"/users/login"
    end

    post '/login' do 
       login(params[:username], params[:password])
       redirect '/categories'
    end

    get "/failure" do
        erb :"/users/failure"
    end

    get '/logout' do
        logout!
        # redirect "/login"
        redirect "/"
    end


end