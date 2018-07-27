$(function(){
    attachListeners()

    class RecipeShow{
        constructor(data){
            this.id = data.id
            this.name = data.name
            this.image = data.image.image.profile.url
            this.description = data.description
            this.ingredients = data.ingredients
            this.directions = data.directions
            this.heart = data.hearts[0]
            this.userId = data.user.id
            this.comments = data.comments
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
                    ${this.heart ? hearted : unhearted }
                </div>
                <div class='button'>
                <form class="new_meal" id="new_meal" action="/users/${this.userId}/meals" accept-charset="UTF-8" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                    <input value="${this.userId}" type="hidden" name="meal[user_id]" id="meal_user_id">
                    <input value="${this.id}" type="hidden" name="meal[recipe_id]" id="meal_recipe_id">
                    <input type="submit" name="commit" value="Add to Meal Plan" data-disable-with="Add to Meal Plan">
                </form>
                </div>
                </div>
                <br>
                <div class="scrollButtons">
                if @recipe.id-1 != 0 %>
                    <a href="/recipes/${this.id-1}" class="scroll">&#8249; Previous</a> 
                <% if @recipe.id+1 <= Recipe.all.count %>
                    <a href="/recipes/${this.id+1}" class="scroll">Next &#8250;</a>
                </div>
                </div>
                <br>
                <div class="comments">
                <p>Add Comment</p>
                    <form class="new_comment" id="new_comment" action="/recipes/${this.id}/comments" accept-charset="UTF-8" method="post">
                    <input name="utf8" type="hidden" value="✓">
                    <input type="hidden" name="authenticity_token" value="${AUTH_TOKEN}">
                        <textarea name="comment[content]" id="comment_content"></textarea>
                        <input value="${this.id}" type="hidden" name="comment[recipe_id]" id="comment_recipe_id">
                        <input value="${this.userId}" type="hidden" name="comment[user_id]" id="comment_user_id">
                        <input type="submit" name="commit" value="Post" data-disable-with="Post">
                    </form>
                <br>
                    <a href="/recipe/${this.id}/comments" id="showComments">Show Comments</a>
                <div class="commentList">
                </div>
            `
        }

        ingredientList(){
            const ingredients = this.ingredients.map( ingredient => {
                return `<li class="show">${ingredient}</li>`
            })
            return ingredients
        }

    }

    $(".scroll").click(function(e){
        e.preventDefault()
        $.getJSON(this.href).success(function(data){
            const recipe = new RecipeShow(data)
            $(".content").html(recipe.buildCard())
        })
    })


})


