(function() {
  App.environment = function() {
    if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.MixinContext) {
      return "iOS";
    } else if (window.MixinContext && window.MixinContext.getContext) {
      return "Android";
    } else {
      return undefined;
    }
  };
}).call(this);
