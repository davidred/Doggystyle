Doggystyle.Models.Message = Backbone.Model.extend({
  initialize: function(options) {
    this.user = options.user;
  },

  urlRoot: function() {
    return '/api/users/'+this.user.id+'/messages';
  },
});
