import axios from "axios";
const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");

class Request {
  constructor() {
    this.baseUrl = "";

    this.get = (options) => {
      options.method = "GET";
      this._request(options);
    };
  
    this.put = (options) => {
      options.method = "PUT";
      this._request(options);
    };
  
    this.post = (options) => {
      options.method = "POST";
      this._request(options);
    };

    this.delete = (options) => {
      options.method = "DELETE";
      this._request(options);
    };
  
    this._request = (options) => {
      let requestUrl = this.baseUrl + options.url;
      axios({
        headers: {
          "X-CSRF-Token": csrfToken
        },
        url: requestUrl,
        method: options.method,
        data: options.data
      }).then((res) => {
        options.success && options.success(res);
      }).catch((err) => {
        options.fail && options.fail(err);
      }).then((res) => {
        options.complete && options.complete(res);
      });
    };
  }
}

export default new Request;
