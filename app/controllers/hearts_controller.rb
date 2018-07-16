class HeartsController < ApplicationController

  def heart
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @heart = @user.heart!(@recipe)
    render json: @heart
  end

def unheart
  @user = current_user
  @heart = @user.hearts.find_by_recipe_id(params[:recipe_id])
  @recipe = Recipe.find(params[:recipe_id])
  @heart.destroy!
  # respond_to do |format|
  #   format.html { render partial: ':hearts/button', locals: { recipe: @recipe }, layout: false }
  #   format.json { render :json }
  #   format.js
#  end
end

end
