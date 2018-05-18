// function Activity(attributes){
//   this.id = attributes.id;
//   this.title = attributes.title
//   this.description = attributes.description
// }
//
// Activity.prototype.renderActivity = function(){
//   return Activity.template(this)
// }

$(function(){
  // Activity.templateSource = $("#activity-template").html();
  // Activity.template = Handlebars.compile(Activity.templateSource);
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
  // $("button[data-id]").click(function(e){
  //   let $locButton = $(this)
  //   displayLocActivities($locButton)
  // })
}

function displayReviewForm(){
  $("#review_form_placeholder").show()
  $("#review_form_btn").toggle();
}

function removeForm(){
  $("#review_form_placeholder").hide();
  $("#review_form_btn").toggle()
}

// function displayLocActivities(location){
//   let locationId = location.attr('data-id')
//   $(`#locationCard${locationId}`).after("<div><p>Hi.</p></div>")
// }


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
