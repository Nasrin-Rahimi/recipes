class CategoriesController < ApplicationController

    get '/categories' do
        @categories = Category.all 
        erb :"/categories/index"
    end

    get '/categories/:id' do
        @category = Category.find(params[:id])
        @recipes = Recipe.where("category_id = ?", @category.id)
        erb :"/categories/show"
    end
end