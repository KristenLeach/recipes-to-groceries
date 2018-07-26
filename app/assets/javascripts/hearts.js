function heartListeners(e) {
    e.preventDefault()
    e.stopPropagation() //this is ok to leave out
    const form = this.form
    const type = form.action.includes('unheart') ? 'DELETE' : 'POST'
    $.ajax({
      type,
      url: form.action,
      data: $(this).serialize(),
      success: function(response) {
        if (response.action == 'hearted') {
          $(`#recipe_${response.heart.recipe_id}`).removeClass('far')
          $(`#recipe_${response.heart.recipe_id}`).addClass('fas')
          $(`#recipe_${response.heart.recipe_id}`)
            .parent()
            .parent()
            .attr('action', `/unheart?recipe_id=${response.heart.recipe_id}`)
        } else {
          $(`#recipe_${response.heart.recipe_id}`).removeClass('fas')
          $(`#recipe_${response.heart.recipe_id}`).addClass('far')
          $(`#recipe_${response.heart.recipe_id}`)
            .parent()
            .parent()
            .attr('action', `/heart?recipe_id=${response.heart.recipe_id}`)
        }
      },
    }) 
}