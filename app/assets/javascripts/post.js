$(document).on('turbolinks:load', function() {

    // Function-level strict mode syntax
    'use strict';

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
      var $value = $(this).attr('value');
      $('#in1').val($value)
    });

});
