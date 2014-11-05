Doggystyle.Views.ConversationView = Backbone.View.extend({

  tagName: 'section',

  className: 'page-content',

  template: JST['messages/conversation'],

  initialize: function(options) {
    this.currentUser = options.currentUser;
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.currentUser, "sync", this.render);
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({
      currentUser: this.currentUser,
      user: this.model,
      messages: this.collection,
    });

    this.$el.html(renderedContent);

    return this;
  },
});
