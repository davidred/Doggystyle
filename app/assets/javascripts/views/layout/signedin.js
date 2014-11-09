Doggystyle.Views.SignedInView = Backbone.View.extend({

	template: JST['layout/nav'],

	events: {
		// "click .sign-out-button": "signOut",
	},

	render: function() {
		var renderedContent = this.template();

		this.$el.html(renderedContent);

		var authToken = $('meta[name=csrf-token]').attr('content');
		this.$('input[name=authenticity_token]').val(authToken);
		return this;
	},

	// signOut: function () {
	// 	event.preventDefault();
	// 	alert('sign out');
	// 	$.ajax({
	// 		type: 'delete',
	// 		url: '/session',
	// 	});
	// },
	//
	// redirect: function(event) {
	// 	event.preventDefault();
	// },
});
