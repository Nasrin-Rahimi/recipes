class CategoriesController < ApplicationController

    get '/categories' do
        authentication_required
        @categories = Category.all 
        erb :"/categories/index"
    end

    get '/categories/:id' do
        authentication_required
        @category = Category.find(params[:id])
        @recipes = Recipe.where("category_id = ?", @category.id)
        if @recipes.empty?
            flash.now[:notice] = "No Recipe for this category yet! Please create a new one for it."
        end
        erb :"/categories/show"
    end
end