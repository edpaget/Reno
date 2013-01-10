corsSync = function(method, model, options) {
  baseUrl = "https://zoo-build.herokuapp.com";
  options.url = baseURL + _.result(model, 'url');
  options.crossDomain = true;
  options.xhrFields = { withCredentials: true };

  return Backbone.sync(method, model, options);
};

module.exports = corsSync;