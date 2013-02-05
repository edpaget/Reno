corsSync = function(method, model, options) {
  baseURL = "http://renoapi.zooniverse.org"
  options.url = baseURL + _.result(model, 'url');
  options.crossDomain = true;
  options.xhrFields = { withCredentials: true };

  return Backbone.sync(method, model, options);
};

module.exports = corsSync;