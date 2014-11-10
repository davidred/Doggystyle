Doggystyle.Views.UserOutboxView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

  template: JST['users/outbox'],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({
      outbox: this.collection,
    });

    this.$el.html(renderedContent);

    return this;
  },


})