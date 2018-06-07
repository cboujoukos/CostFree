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

$(function(){
  Category.templateSource = $("#category-template").html();
  Category.template = Handlebars.compile(Category.templateSource);
})

document.addEventListener("turbolinks:load", function() {
  $("#viewAllCategories").click(function(e){
    // let $categoryButton = $(this)
    displayCategories()
    // showCategories();
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

function showCategories(){
  $("#popCategories").toggle();
  $("#allCategoriesPlaceholder").show()
}

function hideCategories(){
  $("#popCategories").toggle();
  $("#allCategoriesPlaceholder").hide()
}

function displayCategories(){
  $.get('/categories').done(function(json){
    console.log(json);
    for (var obj in json) {
      let category = new Category(json[obj])
      console.log(category);
      let categoryCard = category.renderCategory();
      $("#testSpan").append(categoryCard)
    }
  })
}
