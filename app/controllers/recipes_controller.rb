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
            #find a recipe that only the creator user is allowed to edit
            #  binding.pry
             @recipe = Recipe.find(params[:id])
             if current_user.recipes.include?(@recipe)
            # if @recipe = current_user.recipes.find_by(params[:id])
                erb :"/recipes/edit"
            else 
                redirect "/recipes"
            end
        end
    end

    patch '/recipes/:id' do
        if params[:name] == "" || params[:ingredients] == "" || params[:description] == ""
            redirect "/recipes/#{params[:id]}/edit"
        else
            recipe = Recipe.find(params[:id])
            recipe.name = params[:name]
            recipe.ingredients = params[:ingredients]
            recipe.cooktime = params[:cooktime]
            recipe.description = params[:description]
            recipe.save
            redirect "/recipes/#{params[:id]}"
        end
    end

    # delete '/tweets/:id' do
    #     if logged_in?
    #         if params[:id] == session[:user_id].to_s
    #             tweet = Tweet.find(params[:id])
    #             tweet.delete
    #         end
    #         redirect "/tweets"
    #     else
    #         redirect '/login'
    #     end
    # end

end