$(document).on("turbolinks:load", function() {
  var component = $(".image-uploader");

  if (component.length > 0) {
    component.find(".image-uploader-input").on("change", function() {
      if ($(this)[0].files[0]) {
        var blob = URL.createObjectURL($(this)[0].files[0]);
        component.find(".image-uploader-previewer img").attr("src", blob);

        component.find(".image-uploader-mock").removeClass("d-none");
        component.find(".image-uploader-previewer").removeClass("d-none");
        component.find(".image-uploader-placeholder").addClass("d-none");
      } else {
        component.find(".image-uploader-mock").addClass("d-none");
        component.find(".image-uploader-previewer").addClass("d-none");
        component.find(".image-uploader-placeholder").removeClass("d-none");
      }
    });
  }
});
