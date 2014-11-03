Doggystyle.Views.UserShowView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

	template: JST['users/show'],

	initialize: function() {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.collection, "sync", this.render);
	},

	events: {
		"click .js-show-modal": "showModal",
		"click .js-hide-modal": "hideModal",
		"submit form": "saveBasicInfo",
	},

	render: function() {
		var renderedContent = this.template({
			user: this.model,
			// users: this.collection,
		});

		this.$el.html(renderedContent);

		return this;
	},

	hideModal: function(event) {
		event.preventDefault();
		$('#modal').removeClass("is-active")
	},

	showModal: function(event) {
		event.preventDefault();
		$('#modal').addClass("is-active")
	},

	saveBasicInfo: function(event) {
		event.preventDefault();
		attrs = $(event.currentTarget).serializeJSON();
		this.model.save(attrs.user, {patch: true});

		//send info to api/update

		//hide modal on successful save
		//
	}

})