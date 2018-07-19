class Activity {
  constructor(attributes) {
    this.id = attributes.id;
    this.title = attributes.title
    this.description = attributes.description
    this.reviews = attributes.reviews
  }
}


Activity.prototype.renderActivity = function(){
  return Activity.template(this)
}

$(function(){
  Handlebars.registerPartial('activityPartial', document.getElementById('activity-partial').innerHTML);
  Handlebars.registerHelper('limit', function(arr, limit){
    return arr.slice(0,limit)
  Handlebars.registerHelper('sort', function(arr){
    // return arr.sort(function(a,b){
    //   let reviewOne = a.title.toUpperCase();
    //   let reviewTwo = b.title.toUpperCase()
    //   if (reviewOne > reviewTwo){
  	// 	    return 1
    //     } else if (reviewTwo > reviewOne) {
    //       return -1
    //     }
    //   return 0
    //   })
      return arr.sort((a,b) => {
        let reviewOne = a.title.toUpperCase();
        let reviewTwo = b.title.toUpperCase();
        if (reviewOne > reviewTwo){
    		    return 1
          } else if (reviewTwo > reviewOne) {
            return -1
          }
        return 0
        })
    })
  })
  // Activity.templateSource = $("#activity-template").html();
  // Activity.template = Handlebars.compile(Activity.templateSource);
   // attachActivityListeners()
})

document.addEventListener("turbolinks:load", function() {
  $("#review_form_btn").click(function(e){
    e.preventDefault();
    displayReviewForm();
  });
  $("#remove_form").click(function(e){
    e.preventDefault();
    removeForm();
  });
  $("button.full-description[data-id]").click(function(e){
    e.preventDefault();
    let $descButton = $(this)
    toggleFullDescription($descButton);
  })
})

function toggleFullDescription(activityButton){
  let activityId = activityButton.attr('data-id')
  function truncate(string){
    return string.substring(0, 42) + '...'
  }

  $.ajax({
    method: "GET",
    url: `/activities/${activityId}`,
    dataType: "JSON",
  })
  .done(function(rsp){
    console.log(rsp.description);
    let $button = $(`button.full-description[data-id=${rsp.id}]`);
    let $activityDescription = $(`.activityDescriptionDiv[data-id=${rsp.id}] span.card-text`)
    if ($button.text() === "more") {
      $activityDescription.html(rsp.description);
      $button.text("less")
    } else {
      $activityDescription.html(truncate(rsp.description));
      $button.text("more")
    }
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


// function attachActivityListeners(){
//   $("#review_form_btn").click(function(e){
//     e.preventDefault();
//     displayReviewForm();
//   });
//   $("#remove_form").click(function(e){
//     e.preventDefault();
//     removeForm();
//   })
//   // $("button[data-id]").click(function(e){
//   //   let $locButton = $(this)
//   //   displayLocActivities($locButton)
//   // })
// }



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
// document.addEventListener("DOMContentLoaded", function(e){
//   init()
// })
