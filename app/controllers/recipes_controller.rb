class RecipesController < ApplicationController

    get '/recipes' do
        authentication_required
        @recipes = Recipe.all
        erb :"/recipes/index"

    end

    get '/recipes/new' do
        authentication_required
        @categories = Category.all
        erb :"recipes/new"
    end

    post '/recipes' do 
        @recipe = Recipe.create(params["recipe"])
        if !params["category"]["name"].empty?
            @recipe.category = Category.create(name: params["category"]["name"])
            @recipe.save
        end
        if @recipe.valid?
            redirect "/recipes/#{@recipe.id}"
        else
            @categories = Category.all
            erb :"/recipes/new"
        end
    end

    get '/recipes/:id' do
        authentication_required
        @recipe = Recipe.find(params[:id])
        erb :"/recipes/show"
    end

    get '/recipes/:id/edit' do
         #checking if they are logged in
         authentication_required
        #find a recipe that only the creator user is allowed to edit
        @recipe = Recipe.find(params[:id])
        if current_user.recipes.include?(@recipe)
        # if @recipe = current_user.recipes.find_by(params[:id])
            erb :"/recipes/edit"
        else 
            redirect "/categories"
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
        authentication_required
        recipe = Recipe.find(params[:id])
        if current_user.recipes.include?(recipe)
            recipe.delete
        end
        redirect "/recipes"
    end

end