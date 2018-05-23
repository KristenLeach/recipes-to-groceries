class MealsController < ApplicationController
    before_action :validate_user_info 
    skip_before_action :validate_user_info, only: [:index]

    def index
        @meals = current_user.meal_list
        @ingredients = list_ingredients
    end

    def create
      @meal = Meal.create(meal_params)
      if @meal.save
        redirect_to user_meals_path
      else
        render root_path 
      end
    end

    def destroy
        @meal = Meal.find(params[:id])
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

end
