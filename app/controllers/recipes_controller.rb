class RecipesController < ApplicationController

    get '/recipes' do
        # "You are logged in as #{session[:username]}"
        @recipes = Recipe.all
        erb :"/recipes/index"
    end

    get '/recipes/new' do
        #checking if thay are logged in
        if !logged_in?
            redirect "/login"
        else
            "A new recipe form"
            # erb :"recipes/new"
        end

    end

    get '/recipes/:id' do
        @recipe = Recipe.find(params[:id])
        erb :"/recipes/show"
    end

    get '/recipes/:id/edit' do
         #checking if they are logged in
         if !logged_in?
            redirect "/login"
        else
            #find a recipe that only the author user is allowed to edit
            if @recipe = current_user.recipes.find_by(params[:id])
                # "An edit recipe from #{current_user.id} is editing #{recipe.id}"
                erb :"/recipes/edit"
            else 
                redirect "/recipes"
            end
        end
    end

end