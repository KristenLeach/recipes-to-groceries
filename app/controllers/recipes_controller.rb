class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :update_liked, :destroy]
    before_action :validate_user_info
    skip_before_action :validate_user_info, only: [:show]

    def new 
        @recipe = Recipe.new
    end

    def show
        @meal = Meal.new
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        @recipe.ingredients = recipe_params[:ingredients].split(', ')
        if @recipe.save
          redirect_to recipe_path(@recipe)
        else 
          render :new
        end
    end

    def edit
    end

    def update 
        @recipe.update(recipe_params)
            if @recipe.save
                redirect_to root_path
            else
                render :edit
            end
    end

    def destroy
        @recipe.destroy
        redirect_to user_path(current_user)
    end

    private 

    def recipe_params
        params.require(:recipe).permit(:name, :description, :ingredients, :directions, :image, :user_id, :liked)
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

end
