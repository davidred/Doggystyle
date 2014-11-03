Doggystyle.Collections.Conversation = Backbone.Collection.extend({
  initialize: function(options) {
    this.userID = options.userID;
  },

  url: function() {
   return '/api/users/'+this.userID+'/conversation'
  },

  model: Doggystyle.Models.Message,
})