class RecipesController < ApplicationController

    def new 
        #byebug
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to root_path, alert: "User not found"
        #elsif params[:user_id] != current_user.id
            #redirect_to root_path, alert: "You cannot edit someone else's recipe!"
        else
            @recipe = Recipe.new
        end
    end

    def create 
        raise params.inspect
        @recipe = Recipe.create(recipe_params)
        if @recipe.save
          redirect_to recipe_show_path(@recipe)
        else 
          render :new
        end
    end

    def edit
    end

    def update 
        @recipe.update(recipe_params)
            if recipe.save
                redirect_to user_path(current_user)
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
        params.require(:recipe).permit(:name, :description, :ingredients[], :directions, :image, :user_id)
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

end
