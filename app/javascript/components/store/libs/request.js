const url = document.URL;

const request = {
  get: function(options) {
    options.method = "GET";
    this._request(options);
  },

  put: function(options) {
    options.method = "PUT";
    this._request(options);
  },

  post: function(options) {
    options.method = "POST";
    this._request(options);
  },

  _request: function(options) {
    let requestUrl = url + options.url;
    $.ajax({
      url: requestUrl,
      method: options.method,
      data: options.data
    }).done((res) => {
      options.success && options.success(res);
    }).fail((res) => {
      options.fail && options.fail(res);
    }).always((res) => {
      options.complete && options.complete(res);
    });
  }
};

export default request;
