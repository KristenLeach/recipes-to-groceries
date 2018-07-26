class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end 

    def index 
        @recipe = Recipe.find(params[:recipe_id])
        @comments = @recipe.comments
        respond_to do |f|
            f.html
            f.json { render json: @comments, layout: false }
        end
    end

    def show 
        @comment = Comment.find(params[:id])
        respond_to do |f|
            f.html
            f.json { render json: @comment, layout: false }
        end
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
