class WelcomeController < ApplicationController
    before_action :require_login 

    def index
        @recipes = Recipe.all 
        @meal = Meal.new
    end

end
