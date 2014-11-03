Doggystyle.Views.UserInboxView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

  template: JST['users/inbox'],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({
      inbox: this.collection,
    });

    this.$el.html(renderedContent);

    return this;
  },


})