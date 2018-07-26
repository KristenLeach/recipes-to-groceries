    function indexListeners(e){
        e.preventDefault()
        console.log('loading new page')
        const defaultTitle = "<h3> Check out these great recipes! </h3>"
        let title;
        switch(this.text) {
            case 'Popular Recipes':
                title = "<h3> Popular Recipes </h3><h4> Here's what people are meal-planning this week: </h4>";
                break;
            case 'Recipes you Love':
                title = '<h3>Recipes you Love</h3>';
                break;
            default:
                title = defaultTitle;
        };
        $.getJSON(this.href).success(function(data){
            data.length === 0 ? title = "<h3> No Recipes to Show </h3>" : title

            const recipes = data.map( recipeJSON => { 
                const recipeObj = new Recipe(recipeJSON)
                return recipeObj.renderCard()
            })
            $('.content').html(`${title}<div class="recipe-container">${recipes.join('')}</div>`)
            attachListeners()
        })
    }

    function Recipe(json) {
        this.name = json.name
        this.description = json.description
        this.image = json.image.image.profile.url
        this.id = json.id
        this.userImage = json.user.image.image.thumb.url
        this.userName = json.user.name
        this.userId = json.user.id
        this.heart = Array.isArray(json.hearts) && json.hearts[0]
    }

    Recipe.prototype.renderCard = function() {
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
            ${this.heart ? hearted : unhearted }
        </div>
        </div>`
  }

