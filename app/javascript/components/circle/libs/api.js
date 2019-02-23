import request from "./request";

class API {
  constructor() {
    this.baseUrl = "";
    
    this.login = () => {
      window.location.href=`${this.baseUrl}/login`;
    };

    this.logout = (options={}) => {
      request.baseUrl = this.baseUrl;
      options.url = "/logout";
      options.complete = () => {
        window.location.href=`${this.baseUrl}`;
      };
      request.delete(options);
    };

    this.createPost = (options = {}) => {
      request.baseUrl = this.baseUrl;
      options.url = "/api/posts";
      request.post(options);
    };

    this.getPosts = (options={}) => {
      request.baseUrl = this.baseUrl;
      options.url = "/api/posts";
      request.get(options);
    };
  }
}

export default new API;
