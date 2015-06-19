$(document).ready(function() {
  $('#question_submit_BTN').on("click", function(event){
    console.log("in q BTN handler");
    event.preventDefault();

    var target = $(this).parent().attr('action');

    var method = $(this).parent().attr('method')

    var request = $.ajax({
      url: target,
      type: method,
      dataType: "json",
      data: $(this).parent().serialize(),
    })

    request.done(function(response){
      console.log(response);
      $('.list_question').append(response);
    })
    request.fail(function(response){
      console.log(response);
      alert("Fail")
    })
  })
});
