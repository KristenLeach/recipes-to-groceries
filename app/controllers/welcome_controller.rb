class WelcomeController < ApplicationController
    before_action :require_login 

    def index
        @recipes = Recipe.all 
    end

    def top_recipes
        @recipes = Recipe.best_of
        render :best_of
    end

end
