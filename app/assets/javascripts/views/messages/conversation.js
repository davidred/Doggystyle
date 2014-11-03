Doggystyle.Views.ConversationView = Backbone.View.extend({

  tagName: 'section',

  className: 'page-content',

  template: JST['messages/conversation'],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({
      user: this.model,
      messages: this.collection,
    });

    this.$el.html(renderedContent);

    return this;
  },
});