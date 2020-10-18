class UsersController < ApplicationController

    get '/signup' do
        erb :"/users/new"
    end

    post '/users' do
        #check user fields validation, if fields are not valid, stay in signup page!
        user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        redirect '/login'
    end

end