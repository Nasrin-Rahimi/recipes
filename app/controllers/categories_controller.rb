class CategoriesController < ApplicationController

    get '/categories' do
        if logged_in?
            @categories = Category.all 
            erb :"/categories/index"
        else
            redirect "/login"
        end
    end

    get '/categories/:id' do
        if logged_in?
            @category = Category.find(params[:id])
            @recipes = Recipe.where("category_id = ?", @category.id)
            erb :"/categories/show"
        else
            redirect "/login"
        end
    end
end