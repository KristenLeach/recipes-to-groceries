class HeartsController < ApplicationController

  def heart
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @heart = @user.heart!(@recipe)
    respond_to do |f|
      f.html
      f.json (render :json => {heart: @heart, action: 'hearted'})
    end
  end

def unheart
  @user = current_user
  @heart = @user.hearts.find_by_recipe_id(params[:recipe_id])
  @recipe = Recipe.find(params[:recipe_id])
  @heart.destroy!
  respond_to do |f|
    f.html
    f.json (render :json => {heart: @heart, action: 'hearted'})
  end
end

end
