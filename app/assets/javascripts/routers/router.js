Doggystyle.Routers.Router = Backbone.Router.extend({
	initialize: function(options) {
		var signedInView = new Doggystyle.Views.SignedInView();

		options.$rootEl.html(signedInView.render().$el);

		this.collection = options.collection;
		this.$rootEl = options.$rootEl.find('main');
	},

	routes: {
		'': 'usersMatches',
		'users/index': 'usersIndex',
		'users/inbox': 'userInbox',
    'users/outbox': 'userOutbox',
    'users/visitors': 'userVisitors',
    'users/:id': 'userShow',
    'users/:id/conversation': 'conversationShow',
	},

	usersMatches: function () {
		this.collection.fetch();
		var matches = new Doggystyle.Collections.Matches;
		matches.fetch();
		var matchesView = new Doggystyle.Views.UserMatchesView({
			collection: matches,
		});

		this._swapView(matchesView);
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
		var cUser = this.collection.getOrFetch(Doggystyle.currentUserId);
		var model = this.collection.getOrFetch(id);
		var showView = new Doggystyle.Views.UserShowView({
			model: model,
      collection: this.collection,
			currentUser: cUser,
		});

		this._swapView(showView);
	},

  userVisitors: function () {
    var visitors = new Doggystyle.Collections.Visitors();
    visitors.fetch();
		var visitorsView = new Doggystyle.Views.VisitorsView({
      collection: visitors,
    });

    this._swapView(visitorsView);
  },

  userInbox: function () {
    var inbox = new Doggystyle.Collections.Inbox();
    inbox.fetch();
    var inboxView = new Doggystyle.Views.UserInboxView({
      collection: inbox,
    });

    this._swapView(inboxView);
  },
	
	userOutbox: function () {
		var outbox = new Doggystyle.Collections.Outbox();
		outbox.fetch();
		var outboxView = new Doggystyle.Views.UserOutboxView({
			collection: outbox,
		});
		
		this._swapView(outboxView);
	},

  conversationShow: function (id) {
		var cUser = this.collection.getOrFetch(Doggystyle.currentUserId);
    var user = this.collection.getOrFetch(id);
    var conversation = new Doggystyle.Collections.Conversation({ userID: user.id });
    conversation.fetch();
    var conversationView = new Doggystyle.Views.ConversationView({
			currentUser: cUser,
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
