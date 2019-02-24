$(document).on('turbolinks:load', function() {

    // Function-level strict mode syntax
    'use strict';

    //category
    var $filters = $('.filter [filter]'), $boxes = $('.category [category]'), $input = $('input');

    $filters.on('click', function(e) {
      e.preventDefault();
      // var $this = $(this);
      var $filterCategory = $(this).attr('filter');
      $boxes.fadeOut().promise().done(function() {
        $boxes.filter('[category = "' + $filterCategory + '"]').addClass('is-animated').fadeIn();
      });
    });

    $boxes.on('click', function(e) {
      e.preventDefault();
      var value = $(this).attr('value');
      $('#category_name').val(value);
    });


    //url_form
  $('#first_url_name').change(function() {
    $("#second_url_name").fadeIn(500);
    $("#second_name").fadeIn(1000);
    $('#second_name').css('display','block');
  });
  $('#second_url_name').change(function() {
    $("#third_url_name").fadeIn(500);
    $("#third_name").fadeIn(1000);
    $('#third_name').css('display','block');
  });
});
