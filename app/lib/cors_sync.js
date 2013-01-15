corsSync = function(method, model, options) {
  if (location.port < 1024) {
    baseURL = "https://zoo-build.herokuapp.com";
  } else {
    baseURL = "http://localhost:3000";
  }
  options.url = baseURL + _.result(model, 'url');
  options.crossDomain = true;
  options.xhrFields = { withCredentials: true };

  return Backbone.sync(method, model, options);
};

module.exports = corsSync;