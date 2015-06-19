$(document).ready(function() {
  $('.add_question').on("click", function(event){
    event.preventDefault();

    var target = $(this).attr('action');
    var method = $(this).attr('method')


    var request = $.ajax({
      url: target,
      type: method,
      dataType: "json",

    })
    request.done(function(response){
      console.log(response);

    })
    request.fail(function(response){
      alert("Fail")
    })
  })
});
