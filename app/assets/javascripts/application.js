// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function(){
    attachListeners()
})

function attachListeners(){
    $('.liked').on('click', function(e) {
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
      })
}