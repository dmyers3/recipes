// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require tether
//= require bootstrap-sprockets

$(function(){
  // Add/Remove Ingredients on New Recipe Page
  $('.ingredient_container').on('click', function(e) {
    if (e.target.closest('.add_ingredient')) {
      addIngredient(e)
    } else if (e.target.closest('.delete_ingredient')) {
      deleteIngredient(e)
    }
  });
  
  $('.submit_recipe').on('click', function(e) {
    e.preventDefault();
    console.log('submit');
  });
});

function addIngredient(e) {
  e.preventDefault();
  var ingredientInput = $('.ingredient_input').first().clone();
  var newIngredient = ingredientInput.insertAfter($('.ingredient_input').last());
  clearIngredientValues(newIngredient);
}

function deleteIngredient(e) {
  e.preventDefault();
  var clicked_item = e.target.closest('.ingredient_input');
  if ($('.ingredient_input').size() !== 1) {
    clicked_item.remove();
  } else {
    clearIngredientValues(clicked_item);
  }
}

function clearIngredientValues(ingredient) {
  $(ingredient).closest('.ingredient_input').find('input, select').each(function(index, obj) {
    $(obj).val('');
  });
}
