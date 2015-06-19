$(document).ready(function() {

  bindEvents();
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function bindEvents() {

  $('#survey').on('click', '#create-survey', function(each){

    each.preventDefault();
    var action = $('#survey-form').attr('action');
    var method = $('#survey-form').attr('method');
    var item = $('.survey').val();
    console.log('button has been clicked');
    var request = $.ajax({
      url: action,
      type: method,
      dataType: 'JSON',
    });
    request.done(function(response){
      console.log('done yay!!!!!');
      console.log(response);
      //// answer = thing clicked on
    });
    request.fail(function(){
      console.log('fail!!!!!!!!!');
      alert('you have failed, please feel bad');
    })
    console.log('at the end')
  });
};
