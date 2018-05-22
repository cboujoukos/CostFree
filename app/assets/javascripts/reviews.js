class Review {
  constructor(attributes){
    this.id = attributes.id;
    this.title = attributes.title;
    this.rating = attributes.rating;
    this.comment = attributes.comment;
    this.updated_at = attributes.updated_at
    this.activity_id = attributes['activity']['id'];
    this.user_email = attributes['user']['email']
    this.user_id = attributes['user']['id']
  }
}
// function Review(attributes){
//   this.id = attributes.id;
//   this.title = attributes.title;
//   this.rating = attributes.rating;
//   this.comment = attributes.comment;
//   this.updated_at = attributes.updated_at
//   this.activity_id = attributes['activity']['id'];
//   this.user_email = attributes['user']['email']
//   this.user_id = attributes['user']['id']
// }


Review.prototype.renderReview = function(){
  return Review.template(this)
}

 Review.prototype.reformatDate = function(){
   return this.updated_at.slice(5,10).replace('-','/') + "/" + this.updated_at.slice(0,4)
 }

$(function(){
  Handlebars.registerPartial('reviewPartial', document.getElementById('review-partial').innerHTML);
  Handlebars.registerHelper('formatDate', function(timestamp){
     return timestamp.slice(5,10).replace('-','/') + "/" + timestamp.slice(0,4);
  });

  Review.templateSource = $("#review-template").html();
  Review.template = Handlebars.compile(Review.templateSource);

  // attachReviewListeners();
})

document.addEventListener("turbolinks:load", function() {
  $("form#new_review").submit(function(e){
    e.preventDefault();
    var $form = $(this)
    submitNewReview($form);
  })
})

// function attachReviewListeners(){
//   $("form#new_review").submit(function(e){
//     e.preventDefault();
//     var $form = $(this)
//     submitNewReview($form);
//   })
// }


function submitNewReview($form){
  var action = $form.attr("action");
  var params = $form.serialize()
  let posting = $.post(action, params)
  posting.done(function(data){
     console.log(data)
    if (!data.id) {
      console.log(typeof data)
      var errorMessage = []
      for (var key in data) {
        errorMessage.push(`${key} ${data[key]}. `)
      };
      console.log(errorMessage.join("\n"))
      $("#error_msg").html(errorMessage.join("\n"))
      $("form#new_review [name=commit]").prop("disabled", false)
    } else {
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
    }

    // // $("#review_form_btn").toggle();
    // $("#reviewTitle").text(data["title"]);
    // $("#reviewId").text(data["id"]);
    // $(".edit_btn_placeholder").html("<a href='/activities/" + data['activity']['id'] + "/reviews/" + data['id'] + "/edit' id='edit_review_btn' role='button' class='ml-3 btn btn-outline-dark'>Edit your review</a>")
    // $("#reviewComment").text(data["comment"]);
    // $("#reviewUserEmail").text(data["user"]["email"]);
    // $("#reviewUpdatedAt").text(data["updated_at"].slice(5,10).replace('-','/') + "/" + data["updated_at"].slice(0,4));
    // let checkedStars = $("[data-value]").filter(function() {
    //   return  $(this).attr("data-value") <= parseInt(data["rating"]);
    // });
    // checkedStars.addClass("checked")

  })
  .fail(function(e){
    alert("Sorry, something went wrong")
  })

}
// document.addEventListener("DOMContentLoaded", function(e){
//   init()
// })
