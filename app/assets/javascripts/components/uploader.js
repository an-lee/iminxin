$(document).on('turbolinks:load', function() {
  var component = $('.image-uploader');

  if (component.length > 0) {
    component.find('.image-uploader-input').on('change', function() {
      var blob = URL.createObjectURL($(this)[0].files[0]);
      component.find('.image-uploader-previewer img').attr('src', blob);
    })
  }
});
