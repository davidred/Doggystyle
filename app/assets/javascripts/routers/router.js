Doggystyle.Routers.Router = Backbone.Router.extend({
	initialize: function(options) {
		var signedInView = new Doggystyle.Views.SignedInView();
		
		options.$rootEl.html(signedInView.render().$el);
		
		this.collection = options.collection;
		this.$rootEl = $('.page-content');				
	},
	
	routes: {
		'': 'usersIndex',
		'users/:id': 'userShow',
	},
	
	usersIndex: function () {
		this.collection.fetch();
		var indexView = new Doggystyle.Views.UserIndexView({
			collection: this.collection,
		});
		
		// this.$rootEl.html(indexView.render().$el);
		this._swapView(indexView);
	},
	
	userShow: function (id) {
		this.collection.fetch();
		var model = this.collection.getOrFetch(id);
		var showView = new Doggystyle.Views.UserShowView({
			model: model,
			collection: this.collection,
		});

		this._swapView(showView);
	},
	
	_swapView: function (view) {
		this._currentView && this._currentView.remove()
		this._currentView = view;
		this.$rootEl.html(this._currentView.render().$el);
	},
	
})