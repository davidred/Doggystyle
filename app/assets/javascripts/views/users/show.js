Doggystyle.Views.UserShowView = Backbone.View.extend({
	template: JST['users/show'],
	
	initialize: function() {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.collection, "sync", this.render);
	},
	
	events: {
		"click .js-show-modal": "showModal",
		"click .js-hide-modal": "hideModal",
	},
	
	render: function() {
		var renderedContent = this.template({
			user: this.model,
			users: this.collection,
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
	
})