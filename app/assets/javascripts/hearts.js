$(function(){
    $('.like').on('click', function(e){
        e.preventDefault();
       
        $.ajax({ 
            type: this.form.method,
            url: this.form.action, 
            data: $(this).serialize(),
            success: function(response){
                $('#recipe_id <%= @recipe.id %>.liked').html(response);
            }
        });
    })
})