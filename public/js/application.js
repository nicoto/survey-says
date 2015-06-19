$(document).ready(function() {
  $('form.add_question').on("submit", function(event){
    event.preventDefault();

    var form = $(this);
    var target = form.attr('action');
    var method = form.attr('method');

    var request = $.ajax({
      url: target,
      type: method,
      data: form.serialize(),
    });

    request.done(function(response){
      console.log(response);
      $('.list_questions').append(response);
    });

    request.fail(function(response){
      console.log(response);
      alert("Fail")
    });

  });
});
