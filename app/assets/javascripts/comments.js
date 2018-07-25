$(function(){

    class Comment{
        constructor(data){
            this.userName = data.user.name
            this.recipeId = data.recipe_id
            this.userId = data.user_id
            this.content = data.content
            this.createdAt = data.created_at
        }
        commentList(){
            $("commentList").html("<ul><ul>")
        }
        addCommentToList(){
            
        }

    }


    $("#new_comment").submit(function(e){
        e.preventDefault()
        debugger
        $.post(this.action, $(this).serialize(), function(data){
            commentObj = new Comment(data)
            return commentObj.addCommentToList()
          })
    })

    })