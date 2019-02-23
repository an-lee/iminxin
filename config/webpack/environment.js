const { environment } = require("@rails/webpacker");
const theme = require("../../package.json").theme;

const lessLoader = {
  test: (/\.(less)$/i),
  use: [{
    loader: "style-loader",
  }, {
    loader: "css-loader", // translates CSS into CommonJS
  }, {
    loader: "less-loader", // compiles Less to CSS
    options: { modifyVars: theme, javascriptEnabled: true }
  }]
};

environment.loaders.insert("less", lessLoader, { after: "sass"} );

module.exports = environment;
