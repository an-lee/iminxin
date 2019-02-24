import request from "./request";

class API {
  constructor() {
    this.baseUrl = "";
    
    this.login = () => {
      window.location.href=`${this.baseUrl}/login`;
    };

    this.logout = (options={}) => {
      options.url = "/logout";
      options.complete = () => {
        window.location.href=`${this.baseUrl}`;
      };
      request.baseUrl = this.baseUrl;
      request.delete(options);
    };

    this.createPost = (options = {}) => {
      options.url = "/api/posts";
      request.baseUrl = this.baseUrl;
      request.post(options);
    };

    this.createComment = (options = {}) => {
      options.url = `/api/posts/${options.postId}/comments`;
      request.baseUrl = this.baseUrl;
      request.post(options);
    };

    this.getPosts = (options={}) => {
      options.url = "/api/posts";
      request.baseUrl = this.baseUrl;
      request.get(options);
    };
  }
}

export default new API;
