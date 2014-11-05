Doggystyle.Models.User = Backbone.Model.extend({
	urlRoot: '/api/users',

	// preferred: function() {
	// 	if(!this._preferred) {
	// 		this._preferred = {};
	// 		this._preferred.genders = [];
	// 		this._preferred.breeds = [];
	// 		this._preferred.ages = [];
	// 		this._preferred.sizes = [];
	// 		this._preferred.play = [];
	// 	}
	//
	// 	return this._preferred
	// },
	//
	// parse: function(response) {
	// 	if(response.preferences) {
	// 		this._preferred = null;
	// 		response.preferences.forEach( function(preference) {
	// 			if(preference.preference_attribute === "gender") {
	// 				this.preferred().genders.push(preference.value);
	// 			} else if (preference.preference_attribute === "breed") {
	// 				this.preferred().breeds.push(preference.value);
	// 			} else if (preference.preference_attribute === "age") {
	// 				this.preferred().ages.push(preference.value);
	// 			} else if (preference.preference_attribute === "size") {
	// 				this.preferred().sizes.push(preference.value);
	// 			} else if (preference.preference_attribute === "looking_for") {
	// 				this.preferred().play.push(preference.value);
	// 			}
	// 		}.bind(this));
	// 	}
	//
	// 	return response;
	// },

	preferences: function () {
		if(!this._preferences) {
			this._preferences = new Doggystyle.Collections.Preferences({ user: this });
		}

		return this._preferences;
	},

	parse: function(response) {
		if(response.preferences) {
			this.preferences().set(response.preferences, {parse: true});
			delete response.preferences;
		}

		return response;
	},

	genders: {
		1: 'Male', 2: 'Female'
	},

	breeds: {
		0: "Dog",
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

  play: {
		1: "Friendship", 2: "Playmate", 3: "Having Puppies" },
});
