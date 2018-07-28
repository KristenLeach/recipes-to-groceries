function heartListeners(e) {
    e.preventDefault()
    const form = this.form
    const type = form.action.includes('unheart') ? 'DELETE' : 'POST'
    const $icon = $(this.children[0])

    $.ajax({
      type: type,
      url: form.action,
      data: $(this).serialize(),
      success: function(response) {
        if (response.action == 'hearted') {
          $icon.removeClass('far')
          $icon.addClass('fas')
          $icon
            .parent()
            .parent()
            .attr('action', `/unheart?recipe_id=${response.heart.recipe_id}`)
        } else {
          $icon.removeClass('fas')
          $icon.addClass('far')
          $icon
            .parent()
            .parent()
            .attr('action', `/heart?recipe_id=${response.heart.recipe_id}`)
        }
      },
    }) 
}