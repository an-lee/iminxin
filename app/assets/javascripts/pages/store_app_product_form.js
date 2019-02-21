$(document).on("turbolinks:load", function() {
  var component = $(".store-app-product-form");

  if (component.length > 0) {
    var currentCurrency = component.find(".store-app-product-form-currency-selectgoup").data("currentCurrency");
    if (currentCurrency) {
      var selector = "input[name=\"store_app_product[store_app_product_price_attributes][currency_id]\"][value=" + currentCurrency + "]";
      component.find(selector).prop("checked", true);
    }

    component.find("input[name=\"store_app_product[store_app_product_price_attributes][currency_id]\"]").on("change", function() {
      var option = $(this);
      if(option[0].checked) {
        component.find(".store-app-product-form-currency-value-symbol").text(option.data("symbol"));
      }
    });
  }
});
