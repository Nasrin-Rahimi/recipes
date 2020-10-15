class RecipesController < ApplicationController

    get '/recipes' do
        "You are logged in as #{session[:email]}"
    end

end