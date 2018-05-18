function Location(attributes){
  this.id = attributes.id;

}

Location.prototype.renderLocation = function(){
  return Location.template(this)
}

$(function(){
  Location.templateSource = $("#activity-template").html();
  Location.template = Handlebars.compile(Location.templateSource);
  attachLocationListeners();
})

function attachLocationListeners(){
  $("button[data-id]").click(function(e){
    let $locButton = $(this)
    displayLocActivities($locButton)
  })
}

function displayLocActivities(location){
  let locationId = location.attr('data-id')
  $(`#locationCard${locationId}`).after("<div><p>Hi.</p></div>")
  $.get(`/locations/${locationId}`, function(json){
    console.log(json)
  })
}
