Doggystyle.Views.VisitorsView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

	template: JST['visitors/index'],

	initialize: function() {
		this.listenTo(this.collection, "sync", this.render);
	},

	render: function() {

		var renderedContent = this.template({
			visitors: this.collection,
		});

		this.$el.html(renderedContent);

		return this;
	},
});