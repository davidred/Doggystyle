Doggystyle.Collections.Users = Backbone.Collection.extend({
	url: '/api/users',
	
	model: Doggystyle.Models.User,
	
	getOrFetch: function (id) {
		var model = this.get(id);
		if (!model) {
			model = new Doggystyle.Models.User({ id: id });
			model.fetch({
				success: function() {
					this.add(model);
				}.bind(this)
			});
			this.add(model)
		} else {
			model.fetch();
		}
		
		return model;
	},
	
});

Doggystyle.users = new Doggystyle.Collections.Users();
