class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end 

    def index 
        @recipe = Recipe.find(params[:recipe_id])
        @comments = @recipe.comments
        render json: @comments, layout: false
    end

    def show 
        @comment = Comment.find(params[:id])
        render json: @comment, layout: false
    end


    def create 
        @comment = Comment.create(comment_params)
        render :json => @comment, layout: false
    end 

    private 
        def comment_params
            params.require(:comment).permit(:user_id, :recipe_id, :content)
        end
end
