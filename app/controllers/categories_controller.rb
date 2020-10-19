class CategoriesController < ApplicationController

    get '/categories/:id' do
        @category = Category.find(params[:id])
        @recipes = Recipe.where("category_id = ?", @category.id)
        erb :"/recipes/index"
    end
end