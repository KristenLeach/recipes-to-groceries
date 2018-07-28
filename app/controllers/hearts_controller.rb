class HeartsController < ApplicationController

  def heart
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @heart = @user.heart!(@recipe)
    render :json => {heart: @heart, action: 'hearted'}
  end

def unheart
  @user = current_user
  @heart = @user.hearts.find_by_recipe_id(params[:recipe_id])
  @recipe = Recipe.find(params[:recipe_id])
  if @heart 
    @heart.destroy!
  end
  render :json => {heart: @heart, action: 'unhearted'}
end

end
