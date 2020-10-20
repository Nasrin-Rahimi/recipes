class RecipesController < ApplicationController

    get '/recipes' do
        # "You are logged in as #{session[:username]}"
        if logged_in?
            @recipes = Recipe.all
            erb :"/recipes/index"
        else
            redirect "/login"
        end
    end

    get '/recipes/new' do
        #checking if thay are logged in
        if !logged_in?
            redirect "/login"
        else
            @categories = Category.all
             erb :"recipes/new"
        end

    end

    post '/recipes' do 
        #check if all fields are fill then create recipe
        # if !params[:recipe][:name].empty?
            @recipe = Recipe.create(params["recipe"])
            # @recipe.user = current_user
            if !params["category"]["name"].empty?
                @recipe.category = Category.create(name: params["category"]["name"])
                @recipe.save
            end
        
            redirect "/recipes/#{@recipe.id}"
        # else
        #     redirect "/recipes/new"
        # end
    end

    get '/recipes/:id' do
        if logged_in?
            @recipe = Recipe.find(params[:id])
            erb :"/recipes/show"
        else
            redirect "/login"
        end
    end

    get '/recipes/:id/edit' do
         #checking if they are logged in
         if !logged_in?
            redirect "/login"
        else
            #find a recipe that only the creator user is allowed to edit
             @recipe = Recipe.find(params[:id])
             if current_user.recipes.include?(@recipe)
            # if @recipe = current_user.recipes.find_by(params[:id])
                erb :"/recipes/edit"
            else 
                redirect "/categories"
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

    delete '/recipes/:id' do
        if logged_in?
            recipe = Recipe.find(params[:id])
            if current_user.recipes.include?(recipe)
                recipe.delete
            end
            redirect "/recipes"
        else
            redirect '/login'
        end
    end

end