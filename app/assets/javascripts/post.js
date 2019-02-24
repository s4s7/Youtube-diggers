$(document).on('turbolinks:load', function() {

    // Function-level strict mode syntax
    'use strict';

    //category
    var $filters = $('.filter [filter]'), $boxes = $('.category [category]'), $input = $('input');

    $filters.on('click', function(e) {
      e.preventDefault();
      var $filterCategory = $(this).attr('filter');
      $boxes.fadeOut().promise().done(function() {
        $boxes.filter('[category = "' + $filterCategory + '"]').addClass('is-animated').fadeIn();
      });
    });

    $boxes.on('click', function(e) {
      e.preventDefault();
      var value = $(this).attr('value');
      $('#category_name').val(value);

      // カテゴリー別ランキング
      var ranking_result = $(".form_research");
      function rankingUrl(data, num){
        var html = `<div class='card'>
                      <div class='card__image'>
                        <a target='_blank' href= '${data.url}' >
                          <img height='180' src='${data.thumbnail}'>
                        </a>
                      </div>
                      <div class='card__content'>
                        <div class='card__content_order'>${num}</div>
                        <div class='card__content_info'>
                          <div class='card__content_info_title'>
                            ${data.title}
                          </div>
                          <div class='card__content_info_detail'>
                            ${data.author}
                          </div>
                          <p>
                            ${data.view}回視聴
                          </p>
                        </div>
                      </div>
                    </div>`
        ranking_result.append(html);
      }
      var category = $('#category_name').val()
      $.ajax({
        url: '/urls/research/',
        type: 'GET',
        data: {category: category},
        dataType: 'json',
        contentType: false
      })
      .done(function(data){
        $(".card").remove();
        data.forEach(function(url, index){
          index += 1
          rankingUrl(url, index);
        });
      })
      .fail(function(){
        alert('カテゴリーを選択してください')
      })
    })

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
