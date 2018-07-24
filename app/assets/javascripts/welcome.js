$(function(){
    $(".indexPages").click(function(e){
        e.preventDefault()
        $.getJSON(this.href).success(function(data){
            const recipes = data.map( recipeJSON => {
                //debugger
                const recipeObj = new Recipe(recipeJSON)
                
                return recipeObj.renderCard()
            })
            $('.content').html(`<div class="recipe-container">${recipes.join('')}</div>`)
        })
    })
    
    function Recipe(json) {
        this.name = json.name
        this.description = json.description
        this.image = json.image.image.profile.url
        this.id = json.id
        this.userImage = json.user.image.image.thumb.url
        this.userName = json.user.name
        this.userId = json.user.id
        //debugger
    }

    Recipe.prototype.renderCard = function() {
        var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
            console.log(AUTH_TOKEN)
        return `<div class='recipe-card'>
        <img src= ${this.image} class='recipe-img'>
        <a href="/recipes/${this.id}" class='name'>${this.name}</a>
        <p class='description'>${this.description}</p>
        <div class='button'>
            <form class="new_meal" id="new_meal" action="/users/${this.userId}/meals" accept-charset="UTF-8" method="post">
                <input name="utf8" type="hidden" value="✓">
                <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                <input value="${this.userId}" type="hidden" name="meal[user_id]" id="meal_user_id">
                <input value="${this.id}" type="hidden" name="meal[recipe_id]" id="meal_recipe_id">
                <input type="submit" name="commit" value="Add to Meal Plan" data-disable-with="Add to Meal Plan">
            </form>
        </div>
        <img src= ${this.userImage} class='user-img'>
        <small class='user-link'><a href="/users/${this.userId}">${this.userName}</a></small>
        <div class='liked'>
            <form class="button_to" method="post" action="/heart?recipe_id=${this.id}">
                <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                <button class="liked" type="submit">
                <i class="far fa-heart" id="recipe_2"></i>
                </button>
            </form>
        </div>
        </div>`
  }

})
