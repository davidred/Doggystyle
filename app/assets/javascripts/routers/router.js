Doggystyle.Routers.Router = Backbone.Router.extend({
	initialize: function(options) {
		var signedInView = new Doggystyle.Views.SignedInView();

		options.$rootEl.html(signedInView.render().$el);

		this.collection = options.collection;
		this.$rootEl = $('main');
	},

	routes: {
		'': 'usersIndex',
		'users/inbox': 'userInbox',
    'users/outbox': 'userOutbox',
    'users/:id': 'userShow',
    'users/:id/conversation': 'conversationShow'
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

  userInbox: function () {
    var inbox = new Doggystyle.Collections.Inbox()
    inbox.fetch();
    var inboxView = new Doggystyle.Views.UserInboxView({
      collection: inbox,
    });

    this._swapView(inboxView);
  },

  conversationShow: function (id) {
    var user = this.collection.getOrFetch(id);
    var conversation = new Doggystyle.Collections.Conversation({ userID: user.id });
    conversation.fetch();
    var conversationView = new Doggystyle.Views.ConversationView({
      model: user,
      collection: conversation,
    });

    this._swapView(conversationView);
  },

	_swapView: function (view) {
		this._currentView && this._currentView.remove()
		this._currentView = view;
		this.$rootEl.append(this._currentView.render().$el);
	},

})