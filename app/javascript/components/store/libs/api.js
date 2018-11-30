import request from './request';

const api =  {
  getPagesHome: (options) => {
    options.url = '/pages/home';
    request.get(options)
  },

  getPagesCategory: (options) => {
    options.url = '/pages/category';
    request.get(options)
  },

  getPagesCart: (options) => {
    options.url = '/pages/cart';
    request.get(options)
  },

  getPagesMine: (options) => {
    options.url = '/pages/mine';
    request.get(options)
  }
}

export default api;
