class CategoriesController < ApplicationController

    get '/categories/:id' do
        category = Category.find(params[:id])
        "list of all recipes of #{category.name}"
    end
end