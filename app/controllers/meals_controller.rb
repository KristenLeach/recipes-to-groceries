class MealsController < ApplicationController
    before_action :user_exist
    before_action :match_user

    def index
        @ingredients = list_ingredients
        @recipes = list_recipes
    end

    def create
      @meal = Meal.create(meal_params)
      if current_user.meals.include?(@meal.recipe_id)
        byebug
        redirect to root_path, alert: "That recipe is already in your Meal Plan!"
      elsif @meal.save
        redirect_to user_meals_path
      else
        render root_path 
      end
    end

    def destroy
        byebug
        @meal = Meal.find(params[:meal][:id])
        @meal.destroy
        redirect_to user_meals_path
    end
    
    private

    def meal_params
        params.require(:meal).permit(:user_id, :recipe_id)
    end

    def list_ingredients
      @ingredients = []
      meals = Meal.where(:user_id => current_user.id)
        meals.each do |meal| 
            meal.recipe.ingredients.map {|ingredient| @ingredients << ingredient}
        end
      @ingredients.uniq
    end

    def list_recipes
        @recipes = []
        meals = Meal.where(:user_id => current_user.id)
          meals.each {|meal| @recipes << meal.recipe}
          @recipes.uniq
    end
    
end
