$(function(){
  attachReviewListeners();
})

function attachReviewListeners(){
  $("#remove_form").click(function(e){
    e.preventDefault();
    removeForm();
  })
}

function removeForm(){
  $("#review_form_placeholder").hide();
  $("#review_form_btn").toggle()
}
