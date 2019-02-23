import request from "./request";

class API {
  constructor() {
    this.baseUrl = "";
    
    this.login = () => {
      window.location.href=`${this.baseUrl}/login`;
    };

    this.logout = (options={}) => {
      options.url = "/logout";
      request.baseUrl = this.baseUrl;
      options.complete = () => {
        console.log('here');
        window.location.href=`${this.baseUrl}`;
      };
      request.delete(options);
    };

    this.getPagesHome = (options={}) => {
      options.url = "api/home";
      request.get(options);
    };
  
    this.getPagesPostNew = (options={}) => {
      options.url = "api/category";
      request.get(options);
    };
  
    this.getPagesMine = (options={}) => {
      options.url = "api/cart";
      request.get(options);
    };
  }
}

export default new API;
