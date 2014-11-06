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

  events: {
    "click #send-message": "sendMessage",
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

  sendMessage: function(event) {
    event.preventDefault();

    var message = new Doggystyle.Models.Message({user: this.currentUser})
    var formData = $('.new-message > textarea').serializeJSON().message;
    formData = _.extend(
      formData,
      { to: this.model.id }
    )
    var view = this;
    var attributes = { message: formData }

    message.set(attributes);
    message.save(attributes, { success: function(model) {
      view.collection.add(model);
    }});
  },
  // sendMessage: function(event) {
  //   event.preventDefault();
  //   var message = $('.new-message > textarea').serializeJSON();
  //   var v
  //   $.ajax({
  //     type: "post",
  //     url: "api/users/"+this.currentUser.id+"/messages",
  //     data: message,
  //     success: function(data) {
  //       var message = new Doggystyle.model
  //
  //   }
  //   });
  // },
});
