$(function(){
  attachActivityListeners();
})

function attachActivityListeners(){
  $("#review_form_btn").click(function(e){
    e.preventDefault();
    displayReviewForm();
  });
  $("#remove_form").click(function(e){
    e.preventDefault();
    removeForm();
  })
  $("form#new_review").submit(function(e){
    e.preventDefault();
    var $form = $(this)
    submitNewReview($form);
  })
}

function displayReviewForm(){
  $("#review_form_placeholder").show()
  $("#review_form_btn").toggle();
}

function removeForm(){
  $("#review_form_placeholder").hide();
  $("#review_form_btn").toggle()
}

// function submitNewReview($form){
//   var action = $form.attr("action");
//   var params = $form.serialize()
//
//   let posting = $.post(action, params)
//   posting.done(function(json){
//     console.log(json)
//     let review = new Review()
//   })
// }
