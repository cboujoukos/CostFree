$(function(){
  attachReviewListeners();
})

function attachReviewListeners(){

  $("form#new_review").submit(function(e){
    e.preventDefault();
    var $form = $(this)
    submitNewReview($form);
  })
}


function submitNewReview($form){
  var action = $form.attr("action");
  var params = $form.serialize()

  let posting = $.post(action, params)
  posting.done(function(json){
    console.log(json)
    let review = new Review()
  })
}
