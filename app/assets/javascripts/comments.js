    class Comment{
        constructor(data){
            debugger
            this.userName = data.user.name
            this.recipeId = data.recipe_id
            this.userId = data.user_id
            this.content = data.content
            this.posted = postedTime(data.created_at)
        }

        addCommentToList(){
            return `<li><p>${this.content}</p><small><b>${this.userName}</b> @ ${this.posted}</small></li>`
        }

    }
    function showAllComments(path){
        $.getJSON(path).success(function(data){
            debugger
            const comments = data.map( commentJSON => { 
                const commentObj = new Comment(commentJSON)
                return commentObj.addCommentToList()
            })
            $("#comment_content").val('')
            $('.commentList').html(`<ul>${comments.reverse().join('')}</ul>`)
        })
    }

    function newComment(e){
        e.preventDefault()
        const path = this.action
        $.post(path, $(this).serialize(), function(data){

            showAllComments(path)
          })
    }

    function showComments(e){
        e.preventDefault()
        debugger
        showAllComments(this.href)
    }

    function postedTime(createdAt){
        date = new Date(createdAt)
        return date.toLocaleString()
    }
