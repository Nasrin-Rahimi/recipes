class RecipesController < ApplicationController

    get '/recipes' do
        authentication_required
        # @recipes = Recipe.all
        @recipes = current_user.recipes
        if @recipes.empty?
            flash.now[:notice] = "You don't have any Recipe. Please create one from a New Recipe link."
        end

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
         authentication_required
        @recipe = Recipe.find(params[:id])
        if current_user.recipes.include?(@recipe) 
            erb :"/recipes/edit"
        else 
            flash[:notice] = "Only the User that created the Recipe can edit it!"
            redirect "/recipes/#{params[:id]}"
        end
    end

    patch '/recipes/:id' do
        if params[:name].empty? || params[:ingredients].empty? || params[:description].empty?
            flash[:notice] = "Please enter Recipe's Name, Ingredients and Description"
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
        flash[:notice] = "Only the User that created the Recipe can delete it!"
        redirect "/recipes/#{params[:id]}"
    end

end