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
    "click .js-show-input": "showInput",
    "click .js-hide-input": "hideInput",
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
    var targetModal = event.currentTarget.dataset.modal;
		$('#'+targetModal).removeClass("is-active");
	},

	showModal: function(event) {
		event.preventDefault();
    var targetModal = event.currentTarget.dataset.modal;
		$('#'+targetModal).addClass("is-active");

	},

  showInput: function(event) {
    event.preventDefault();
    var targetInput = event.currentTarget.dataset.input;
    $('p#'+targetInput).addClass("inactive");
    $('button.'+targetInput).removeClass("inactive");
    $('form#'+targetInput).removeClass("inactive");
  },

  hideInput: function(event) {
    event.preventDefault();
    var targetInput = event.currentTarget.dataset.input;
    $('p#'+targetInput).removeClass("inactive");
    $('form#'+targetInput).addClass("inactive");
    $('button.'+targetInput).addClass("inactive");
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
