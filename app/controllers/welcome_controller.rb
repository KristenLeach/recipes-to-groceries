class WelcomeController < ApplicationController
    before_action :require_login 

    def index
        @recipes = Recipe.all 
        respond_to do |f|
            f.html 
            f.json {render json: @recipes, layout: false}
        end
    end

    def popular_recipes
        @recipes = Recipe.best_of
        render json: @recipes, layout: false
    end

    def favorite_recipes
        @recipes = current_user.hearted_recipes
        render json: @recipes, layout: false
    end

end
