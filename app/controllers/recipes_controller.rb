class RecipesController < ApplicationController

    get '/recipes' do
        # "You are logged in as #{session[:email]}"
        "A list of publically available Recipes."
    end

    get '/recipes/new' do
        #checking if thay are logged in
        if !session[:email]
            redirect "/login"
        else
            "A new recipe form"
            # erb :"recipes/new"
        end

    end

end