Doggystyle.Collections.Preferences = Backbone.Collection.extend({
  initialize: function(options) {
    this.user = options.user;
  },

  url: function() {
    return '/api/users/'+this.user.id+'/preferences';
  },

  model: Doggystyle.Models.Preference,
});
