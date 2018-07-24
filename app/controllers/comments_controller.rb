class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end 

    def index 
        @comment = Comment.find(params[:id])
    end

    def create 
        @comment = Comment.create(comment_params)
        @recipe = Recipe.find(params[:recipe_id])
        redirect_to recipe_comment_path(@recipe, @comment)
    end 

    private 
        def comment_params
            params.require(:comment).permit(:user_id, :recipe_id, :content)
        end
end
