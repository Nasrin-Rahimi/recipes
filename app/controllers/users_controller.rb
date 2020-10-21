class UsersController < ApplicationController

    get '/signup' do
        erb :"/users/signup"
    end

    post '/signup' do
        @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        if @user.valid?
             #Emailing them to let them know they signed up
            redirect '/login'
        else
            erb :"/users/signup"
        end
    end

    get '/login' do
        erb :"/users/login"
    end

    post '/login' do 
        if params[:username].empty? || params[:password].empty?
            flash[:notice] = "Please enter Username and Password!"
            redirect 'login'
        else
            login(params[:username], params[:password])
            redirect '/categories'
        end
    end

    get "/failure" do
        erb :"/users/failure"
    end

    get '/logout' do
        logout!
        redirect "/"
    end

end