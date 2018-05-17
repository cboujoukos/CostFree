$(function(){
  attachListeners();
})

function attachListeners(){
  $("#review_form_btn").click(function(e){
    e.preventDefault();
    displayReviewForm();
  })
}

function displayReviewForm(){

  // $("#review_form_placeholder").html(`${render partial: 'reviews/form', locals: { activity: @activity, review: @activity.reviews.build } }`);
  $("#review_form_placeholder").show()
  $("#review_form_btn").toggle();
}
