define ['backbone', 'underscore'], (Backbone, _) ->
  module = {}

  class module.Model extends Backbone.Model

  # A collection should need to do a few extra things for us:
  # - allow sync() to use jsonp by default.
  # - setup subscriptions. That is, if a collection has been created we should
  # start long-polling and updating that collection automatically.
  # - allow a collection 'resource' to be shared between different widgets.
  # Multiple widgets should ideally share calls to the sever and the data.
  class module.Collection extends Backbone.Collection
    sync: (method, model, options) ->
      options = _.extend {
        type: "GET"
        dataType: "jsonp"
        processData: false
      }, options
      super(method, model, options)

  module