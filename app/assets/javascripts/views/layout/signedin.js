Doggystyle.Views.SignedInView = Backbone.View.extend({
	
	template: JST['layout/nav'],
	
	render: function() {
		var renderedContent = this.template();
		
		this.$el.html(renderedContent);
		
		return this;
	},
});