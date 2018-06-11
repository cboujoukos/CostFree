class Review {
  constructor(attributes){
    this.id = attributes.id;
    this.title = attributes.title;
    this.rating = attributes.rating;
    this.comment = attributes.comment;
    this.updatedAt = attributes.updatedAt
    this.activityId = attributes['activity']['id'];
    this.userEmail = attributes['user']['email']
    this.userId = attributes['user']['id']
  }
}

Review.prototype.renderReview = function(){
  return Review.template(this)
}

 Review.prototype.reformatDate = function(){
   return this.updatedAt.slice(5,10).replace('-','/') + "/" + this.updatedAt.slice(0,4)
 }

$(document).on("turbolinks:load", function(){
  Handlebars.registerPartial('reviewPartial', document.getElementById('review-partial').innerHTML);
  Handlebars.registerHelper('formatDate', function(timestamp){
     return timestamp.slice(5,10).replace('-','/') + "/" + timestamp.slice(0,4);
  });

  Review.templateSource = $("#review-template").html();
  Review.template = Handlebars.compile(Review.templateSource);
})


document.addEventListener("turbolinks:load", function() {
  $("form#new_review").submit(function(e){
    e.preventDefault();
    let $form = $(this)
    submitNewReview($form);
  })
})

function submitNewReview($form){
  let action = $form.attr("action");
  let params = $form.serialize()
  let posting = $.post(action, params)
  posting.done(function(data){
     console.log(data)
    if (!!data.id) {
      let review = new Review(data);
      let reviewCard = review.renderReview();
      $("#reviewBox").prepend(reviewCard);
      $("#timestampHolder").html(review.reformatDate());

      if (review.rating > 1){
        $("#2starHb").addClass("checked")
      }
      if (review.rating > 2){
        $("#3starHb").addClass("checked")
      }
      if (review.rating > 3){
        $("#4starHb").addClass("checked")
      }
      if (review.rating > 4){
        $("#5starHb").addClass("checked")
      }
      // $("#newReview").show();
      $("#review_form_placeholder").html("");

    } else {
      console.log(typeof data)
      let errorMessage = []
      for (var key in data) {
        errorMessage.push(`<li>${key} ${data[key]}.</li>`)
      };
      console.log(errorMessage.join().replace(/,/gi, ', '))
      $("#error_msg").html(errorMessage.join("\n").replace(/,/gi, ', '))
      $("form#new_review [name=commit]").prop("disabled", false)
    }
  })
  .fail(function(e){
    alert("Sorry, something went wrong")
  })

}

///////////////// Traditional Ready function does not work with turbolinks //////////
$(function(){
  Handlebars.registerPartial('reviewPartial', document.getElementById('review-partial').innerHTML);
  Handlebars.registerHelper('formatDate', function(timestamp){
     return timestamp.slice(5,10).replace('-','/') + "/" + timestamp.slice(0,4);
  });

  Review.templateSource = $("#review-template").html();
  Review.template = Handlebars.compile(Review.templateSource);


  // attachReviewListeners();
})

// function attachReviewListeners(){
//   $("form#new_review").submit(function(e){
//     e.preventDefault();
//     var $form = $(this)
//     submitNewReview($form);
//   })
// }
