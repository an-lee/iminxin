$(document).on('turbolinks:load', function() {
  let component = $('.loading-more-component');
  if (component.length > 0) {
    component.on('click', function(e) {
      let loadingMore = component.find('.loading-more');
      let url = loadingMore.data('url');
      let currentPage = loadingMore.data('currentPage');
      let nextPage = parseInt(currentPage) + 1;

      loadingMore.attr('disabled', true);
      $.ajax({
        type: 'GET',
        url: url,
        data: { page: nextPage },
        contentType: 'application/json',
        dataType: 'script'
      });
    })
  };

});
