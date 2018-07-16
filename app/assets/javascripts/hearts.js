$(function() {
    $('.like').on('click', function(e) {
      e.preventDefault()
      $.ajax({
        type: this.form.method,
        url: this.form.action,
        data: $(this).serialize(),
        success: function(response) {
          $(`#recipe_${response.recipe_id}`).removeClass('far')
          $(`#recipe_${response.recipe_id}`).addClass('fas')
        },
      })
    })
 

    $('.unlike').on('click', function(e){
      e.preventDefault()
      $.ajax({
        type: $("input[name='_method']").val(),
        url: this.form.action, 
        data: $(this).serialize(),
        success: function(response) {
            $(`#recipe_${response.recipe_id}`).removeClass('fas')
            $(`#recipe_${response.recipe_id}`).addClass('far')
            }
        })
    })
})