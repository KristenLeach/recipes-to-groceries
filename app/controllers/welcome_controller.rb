class WelcomeController < ApplicationController
    before_action :require_login 

    def index
        @recipes = Recipe.all 
        respond_to :html, {json: @recipes, layout: false} 
    end

    def popular_recipes
        @recipes = Recipe.best_of
        render :popular_recipes
        respond_to :html, {json: @recipes, layout: false} 
    end

    def favorite_recipes
        @recipes = current_user.hearted_recipes
        respond_to :html, {json: @recipes} 
    end

end
