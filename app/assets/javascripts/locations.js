function Location(attributes){
  this.id = attributes.id;
  this.activities = attributes.activities
}

Location.prototype.renderLocation = function(){
  return Location.template(this)
}

$(function(){
  Location.templateSource = $("#location-template").html();
  Location.template = Handlebars.compile(Location.templateSource);
  attachLocationListeners();
})

function attachLocationListeners(){
  $("button[data-id]").click(function(e){
    let $locButton = $(this)
    displayLocActivities($locButton)
  })
}

function displayLocActivities(locationArg){
  let locationId = locationArg.attr('data-id')
  // $(`#locationCard${locationId}`).after("<div><p>Hi.</p></div>")
  $.get(`/locations/${locationId}`, function(json){
    console.log(json)
    let location = new Location(json);
    let locationActivities = location.renderLocation();

    $(`#locationCard${locationId}`).after(locationActivities)
  })
}

// document.addEventListener("DOMContentLoaded", function(e){
//   init()
// })
