$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
    $('.hidden').hide();

    $('#submit_answer').click( function( event ) {
      event.preventDefault();
      $( ".card" ).toggleClass('flipped');
      $(this).hide();
      var data = $(this).parent().serialize()
      var location = $(this).parent().attr('action');
      $.ajax({
        type: "POST",
        url: location,
        data: data,
        dataType: "json"
      }).done(function(response){
        $('#answer').append(response.correct);
        $('.back').css("background-color", response.color);
        $('.hidden').show();
      }).fail(function(response){
        console.log("fail");
      });
    });

    $('#new_card').submit(function(event){
      event.preventDefault();
      console.log("this works")
      $.ajax({
        type: "POST",
        url: $(this).attr('action'),
        data: $(this).serialize()
        // dataType: "json"
      }).success(function(response){
        console.log(response)
        $('#new_questions').empty()
        $('#new_questions').html(response)
      }).complete(function(){
        $('#new_card').each (function(){
          this.reset();
        })
      })
    })

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

