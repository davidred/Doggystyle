window.Doggystyle = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		new Doggystyle.Routers.Router({
			$rootEl: $('body'),
			collection: Doggystyle.users
		});
		
		Backbone.history.start();
  }
};

$(document).ready(function(){
  Doggystyle.initialize();
});
