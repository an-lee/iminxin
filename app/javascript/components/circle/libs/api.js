import request from "./request";

class API {
  constructor() {
    this.getPagesHome = (options) => {
      options.url = "/pages/home";
      request.get(options);
    },
  
    this.getPagesCategory = (options) => {
      options.url = "/pages/category";
      request.get(options);
    },
  
    this.getPagesCart = (options) => {
      options.url = "/pages/cart";
      request.get(options);
    },
  
    this.getPagesMine = (options) => {
      options.url = "/pages/mine";
      request.get(options);
    };
  }
}

export default new API;
