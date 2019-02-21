$(document).on("turbolinks:load", function() {
  $(".mixin-holder-limit").on("click", function(e) {
    $("#mixin-holder-limit-modal").modal();
    return false;
  });

  $(".mixin-fee-limit").on("click", function(e) {
    $("#mixin-fee-limit-modal").modal();
    return false;
  });

  $(".mixin-login-required").on("click", function(e) {
    $("#mixin-login-modal").modal();
    return false;
  });
});