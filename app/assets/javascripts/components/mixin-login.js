$(document).on('turbolinks:load', function() {
  $('.mixin-login-required').on('click', function(e) {
    $("#mixin-login-modal").modal();
    return false;
  });
});
