
$(function(){
    $(".indexPages").click(function(e){
        e.preventDefault()
        $.getJSON(this.href).success(function(data){
            debugger
            $('.content').html(data)
        }).fail(function( jqxhr, textStatus, error ) {
    var err = textStatus + ", " + error;
    console.log( "Request Failed: " + err );
        });
    })
})

