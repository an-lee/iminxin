(function() {
  App.paymentModal = {
    pollingPaymentStateTimer: null,

    init: function(options) {
      this.modal = $(options['modal_class']);
    },

    startPollingPaymentState: function() {
      var that = this;

      if (that.pollingPaymentStateTimer) {
        clearTimeout(that.pollingPaymentStateTimer);
        that.pollingPaymentStateTimer = null;
      }

      var traceId = that.modal.data('traceId');
      var pollingPath = that.modal.data('pollingPath');
      var path = pollingPath;
      var fn = function() {
        $.get(path, function(data) {
          if (data === 'paid') {
            Turbolinks.visit();
            that.pollingPaymentStateTimer = null;
          } else {
            that.pollingPaymentStateTimer = setTimeout(fn, 1000);
          }
        }).fail(function() {
          that.pollingPaymentStateTimer = setTimeout(fn, 1000);
        });
      };

      fn();
    }
  };
}).call(this);
