$(document).on("turbolinks:load", function() {
  var component = $(".circle-app-setting-form");

  if (component.length > 0) {
    var feeCurrency = component.find(".circle-app-setting-form-fee-currency-selectgoup").data("feeCurrency");
    if (feeCurrency) {
      var selector = "input[name=\"circle_app_setting[fee_currency_id]\"][value=" + feeCurrency + "]";
      component.find(selector).prop("checked", true);
    }

    component.find("input[name=\"circle_app_setting[fee_currency_id]\"]").on("change", function() {
      var option = $(this);
      if(option[0].checked) {
        component.find(".circle-app-setting-form-fee-currency-symbol").text(option.data("symbol"));
      }
    });

    var holderCurrency = component.find(".circle-app-setting-form-holder-currency-selectgoup").data("holderCurrency");
    if (holderCurrency) {
      var selector = "input[name=\"circle_app_setting[holder_limit_currency_id]\"][value=" + holderCurrency + "]";
      component.find(selector).prop("checked", true);
    }

    component.find("input[name=\"circle_app_setting[holder_limit_currency_id]\"]").on("change", function() {
      var option = $(this);
      if(option[0].checked) {
        component.find(".circle-app-setting-form-holder-currency-symbol").text(option.data("symbol"));
      }
    });
  }
});
