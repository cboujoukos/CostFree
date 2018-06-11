class Category {
  constructor(attributes){
    this.id = attributes.id;
    this.title = attributes.title;
    this.icon_file_name = attributes.icon_file_name;
    this.icon_content_type = attributes.icon_content_type;
    this.icon_file_size = attributes.icon_file_size;
  }
}
Category.prototype.renderCategory = function(){
  return Category.template(this)
}

$(document).on("turbolinks:load", function(){
  Category.templateSource = $("#category-template").html();
  Category.template = Handlebars.compile(Category.templateSource);
})

document.addEventListener("turbolinks:load", function() {
  $("#viewAllCategories").click(function(e){
    // let $categoryButton = $(this)
    // displayCategories()
    showCategories();
  });
  $("#fewerCategories").click(function(){
    hideCategories();
  })
})

// function attachCategoryListeners(){
//   $("#viewAllCategories").click(function(){
//     // $("#popCategories").toggle();
//     // $("#allCategoriesPlaceholder").show()
//     displayCategories()
//   })
// }

/////////////////// Displays categories by toggling HTML content on or off /////////////

function showCategories(){
  $("#popCategories").toggle();
  $("#allCategoriesPlaceholder").show()
}

function hideCategories(){
  $("#popCategories").toggle();
  $("#allCategoriesPlaceholder").hide()
}

///////////////// Displays categories through an asynch request ////////////////
// function displayCategories(){
//   $("#popCategories").toggle();
//   $("#testDiv").show();
//   $.get('/categories').done(function(json){
//     console.log(json);
//     for (var obj in json) {
//       let category = new Category(json[obj])
//       console.log(category);
//       let categoryCard = category.renderCategory();
//       $("#testSpan").append(categoryCard)
//     }
//   })
// }
