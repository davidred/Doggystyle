Doggystyle.Views.SignedInView = Backbone.View.extend({

	template: JST['layout/nav'],

	events: {
		"click .sign-out-button": "signOut",
	},

	render: function() {
		var renderedContent = this.template();

		this.$el.html(renderedContent);

		return this;
	},

	signOut: function () {
		event.preventDefault();
		alert('sign out');
		$.ajax({
			type: 'delete',
			url: '/session',
		});
	},
	//
	// redirect: function(event) {
	// 	event.preventDefault();
	// },
});
