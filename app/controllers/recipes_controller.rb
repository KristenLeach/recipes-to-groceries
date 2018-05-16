class RecipesController < ApplicationController

    def new 
        @recipe = Recipe.new
    end

    def create 
      @recipe = Recipe.create(recipe_params)
        if @recipe.save
          redirect_to recipe_show_path(@recipe)
        else 
          render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    private 

    def recipe_params
        params.require(:recipe).permit(:name, :description, :ingredients, :directions, :image, :user_id)
    end

end
