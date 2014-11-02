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
	
	breeds: {
		1: "Corgi", 
		2: "Poodle",
	  3: "Husky",
		4: "Boxer"
	},
	
	countries: {
		1: "USA", 2: "Afghanistan", 3: "Russia"
	},
	
	sizes: {
		1: "Tiny", 2: "Small", 3: "Medium", 4: "Large"
	},
	
	playStyles: {
		1: "Chaser", 2: "Tugger", 3: "Wrestler", 4: "Tackler", 5: "Not Sure"
	},
	
	energyLevels: {
		1: "Super Chill", 2: "Tame", 3: "Likes to party", 4: "Wild Beast"
	},
	
  lookingFors: { 
		1: "Friendship", 2: "Casual Play", 3: "Breeding Partner" },
});

Doggystyle.users = new Doggystyle.Collections.Users();
