//find a way to stop 'next' button at length of recipe array 
$(function(){
    attachListeners()
})
    class RecipeShow{
        constructor(data){
            this.id = data.id
            this.name = data.name
            this.image = data.image.image.profile.url
            this.description = data.description
            this.ingredients = data.ingredients
            this.directions = data.directions
            this.userId = data.user.id
            this.hearts = data.hearts || []
          }
          get isFavorite(){
            return !!this.hearts.find((heart) => heart.user_id == currentUserId())
          }

        buildCard(){
            let AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
            const hearted = `<form class="button_to" method="delete" action="/unheart?recipe_id=${this.id}">
            <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
            <button class="liked" type="submit">
            <i class="fas fa-heart" id="recipe_${this.id}"></i>
            </button>
            </form>`
            const unhearted = `<form class="button_to" method="post" action="/heart?recipe_id=${this.id}">
            <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
            <button class="liked" type="submit">
            <i class="far fa-heart" id="recipe_${this.id}"></i>
            </button>
            </form>`
            const previous = `<a href="/recipes/${this.id-1}" class="scroll">&#8249; Previous</a>`
            const next = `<a href="/recipes/${this.id+1}" class="scroll">Next &#8250;</a>`
            return `
            <div class='show-recipe'>
                <div class='recipe-info'>
                    <img src= ${this.image}>
                <div class="details">
                    <h3>${this.name}</h3>
                    <p class='show-description'>${this.description}</p>
                    <label class='show'>Ingredients:</label>
                        <ul>
                        ${this.ingredientList().join('')}
                        </ul>
                    <label class='show'>Directions:</label>
                        <p class='show-directions'>${this.directions}</p>
                <div class='liked'>
                        ${this.isFavorite ? hearted : unhearted }
                </div>
                <div class='button'>
                <form class="new_meal" id="new_meal" action="/users/${currentUserId()}/meals" accept-charset="UTF-8" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                    <input value="${currentUserId()}" type="hidden" name="meal[user_id]" id="meal_user_id">
                    <input value="${this.id}" type="hidden" name="meal[recipe_id]" id="meal_recipe_id">
                    <input type="submit" name="commit" value="Add to Meal Plan" data-disable-with="Add to Meal Plan">
                </form>
                </div>
                </div>
                <div class="scrollButtons">
                ${this.id-1 != 0 ? previous : '' } 
                ${this.id+1 > 30 ? '' : next }             
                </div>
                </div>
                <br>
                <div class="comments">
                <p>Add a Comment:</p>
                    <form class="new_comment" id="new_comment" action="/recipes/${this.id}/comments" accept-charset="UTF-8" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                        <textarea name="comment[content]" id="comment_content"></textarea>
                        <input value="${this.id}" type="hidden" name="comment[recipe_id]" id="comment_recipe_id">
                        <input value="${currentUserId()}" type="hidden" name="comment[user_id]" id="comment_user_id">
                        <input type="submit" name="commit" value="Post" data-disable-with="Post">
                    </form>
                    <a href="/recipes/${this.id}/comments" id="showComments">Show Comments</a>
                <div class="commentList">
                </div>
            `
        }

        ingredientList(){
            const ingredients = this.ingredients.map(ingredient => {
                return `<li class="show">${ingredient}</li>`
            })
            return ingredients
        }
    }

function recipeScroll(e){
    e.preventDefault()
    console.log("this is ajax")
    $.getJSON(this.href).success(data => {
        const recipe = new RecipeShow(data)
        $(".content").html(recipe.buildCard())
        attachListeners()
    })
}
