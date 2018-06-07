class Location {
  constructor(attributes){
    this.id = attributes.id;
    this.activities = attributes.activities
  }
}


Location.prototype.renderLocation = function(){
  return Location.template(this)
}

$(function(){
  Location.templateSource = $("#location-template").html();
  Location.template = Handlebars.compile(Location.templateSource);
  // attachLocationListeners();
})

document.addEventListener("turbolinks:load", function() {
  $("button[data-id]").click(function(e){
    let $locButton = $(this)
    displayLocActivities($locButton)
  })
})

// function attachLocationListeners(){
//   $("button[data-id]").click(function(e){
//     let $locButton = $(this)
//     displayLocActivities($locButton)
//   })
// }

function displayLocActivities(locationArg){
  let locationId = locationArg.attr('data-id')
  // $(`#locationCard${locationId}`).after("<div><p>Hi.</p></div>")
  $.get(`/locations/${locationId}`, function(json){
    console.log(json)

  let reviews = json.activities[0].reviews.sort(function(a,b){
    if (a.title.toUpperCase() > b.title.toUpperCase()){
		    return 1
      } else if (b.title.toUpperCase() > a.title.toUpperCase()) {
        return -1
      }
    return 0
    })
    let location = new Location(json);
    let locationActivities = location.renderLocation();

    // $(`#locationCard${locationId}`).after(locationActivities)
    if ($(`button[data-id=${locationId}]`).html() == "View"){
      $(`#location${locationId}Activities`).html(locationActivities);
      $(`button[data-id=${locationId}]`).html('Hide')
    } else if ($(`button[data-id=${locationId}]`).html() == "Hide") {
      $(`#location${locationId}Activities`).html("");
      $(`button[data-id=${locationId}]`).html('View')
    }

  })
}

// document.addEventListener("DOMContentLoaded", function(e){
//   init()
// })
