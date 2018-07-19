
$(function(){
    console.log('hey')
    $("#favorites").click(function(){
        console.log('fuck')
        debugger
        $.getJSON(this.href, function(data){
            debugger
            $("content").html(recipes)
        })
    })
})

