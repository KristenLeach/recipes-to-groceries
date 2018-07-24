$(function(){
    $(".postComment").click(function(e){
        e.preventDefault()
        debugger
        $.post(this.form.action, function(resp){
            debugger
            const comment = data.map( recipeJSON => {
                //debugger
                const recipeObj = new Recipe(recipeJSON)
                
                return recipeObj.renderCard()
            })
            $('.content').html(`<div class="recipe-container">${recipes.join('')}</div>`)
        })
    })

    })