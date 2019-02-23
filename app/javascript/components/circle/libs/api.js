import request from "./request";

class API {
  constructor(props) {
    this.login = (options) => {
      options.url = "/login";
      request.baseUrl = props.baseUrl;
      request.get(options);
    };

    this.logout = (options) => {
      options.url = "/logout";
      request.baseUrl = props.baseUrl;
      request.delete(options);
    };

    this.getPagesHome = (options) => {
      options.url = "api/home";
      request.baseUrl = props.baseUrl;
      request.get(options);
    };
  
    this.getPagesPostNew = (options) => {
      options.url = "api/category";
      request.baseUrl = props.baseUrl;
      request.get(options);
    };
  
    this.getPagesMine = (options) => {
      options.url = "api/cart";
      request.baseUrl = props.baseUrl;
      request.get(options);
    };
  }
}

export default new API;
