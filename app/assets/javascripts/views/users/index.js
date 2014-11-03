Doggystyle.Views.UserIndexView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

	template: JST['users/index'],

	initialize: function() {
		this.listenTo(this.collection, "sync", this.render);
	},

	events: {
		'click button': 'showUser'
	},

	render: function() {

		var renderedContent = this.template({
			users: this.collection,
		});

		this.$el.html(renderedContent);

		return this;
	},

	showUser: function(event) {
		event.preventDefault();
		Backbone.history.navigate('/users/' + event.currentTarget.dataset.id, {trigger: true})
	},

});