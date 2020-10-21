class Recipe < ActiveRecord::Base
    belongs_to :category
    belongs_to :user

    validates_presence_of :name, :ingredients, :description, :category_id, :message  => "can’t be blank"
end