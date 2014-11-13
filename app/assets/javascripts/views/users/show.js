Doggystyle.Views.UserShowView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

	template: JST['users/show'],

	initialize: function(options) {
    this.currentUser = options.currentUser;
		this.listenTo(this.model, "sync", this.render);
	},

	events: {
		"click .js-show-modal": "showModal",
		"click .js-hide-modal": "hideModal",
    "click .btn-new-message": "showMessageModal",
    "click #send-message": "sendMessage",
    "click .js-show-input": "showInput",
    "click .js-hide-input": "hideInput",
    "click .save-user-info": "saveProfileInfo",
		"submit form.basic-info-form": "saveBasicInfo",
    "submit form.looking-for-form": "saveLookingForInfo",
    "submit form.owner-info-form": "saveOwnerInfo",
    "click button#save-profile-picture": "handlePhoto",
    "click li.choose-size": "updateSize",
    "mouseenter li.choose-size": "previewSize",
	},

  previewSize: function(event) {
    var size = event.currentTarget.dataset.size;
    var input = event.currentTarget.dataset.input;
    $('.current-size').removeClass('Tiny Small Medium Large');
    $('.current-size').addClass(size);
  },

  updateSize: function(event) {
    var size = event.currentTarget.dataset.value;
    var input = event.currentTarget.dataset.input;
    $('#user-size-input').val(size);
    attrs = $('form#'+input).serializeJSON();
    this.model.save(attrs, {patch: true});
  },

	render: function() {
		var renderedContent = this.template({
			user: this.model,
			currentUser: this.currentUser,
		});

		this.$el.html(renderedContent);

    if (this.model.id === Doggystyle.currentUserId) {
      $('.js-show-modal').parent().addClass('clickable');
      $('.js-show-input').parent().addClass('clickable');
    }

		return this;

	},

  sendMessage: function(event) {
    var message = new Doggystyle.Models.Message({user: this.currentUser})
    var formData = $('.new-message-modal > textarea').serializeJSON().message;
    formData = _.extend(
      formData,
      { to: this.model.id }
    )
    var view = this;
    var attributes = { message: formData }

    message.set(attributes);
    message.save(attributes, { success: function(model) {
    }});
  },

  handlePhoto: function(event) {
    event.preventDefault();
    $('#profile-picture-modal').removeClass('is-active');
    var file = $('.photo-upload')[0].files[0];
    var view = this;
    var formData = new FormData();
    formData.append('new_photo', file);

    $.ajax({
      type: 'put',
      url: 'api/users/'+Doggystyle.currentUserId+'/photo',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        console.log(data);
        $('.profile-picture > img').attr('src', data)
      }
    });

  },

	hideModal: function(event) {
		event.preventDefault();
    var targetModal = event.currentTarget.dataset.modal;
		$('#'+targetModal).removeClass("is-active");
	},

  showMessageModal: function(event) {
    event.preventDefault();
    $('.message-modal').addClass("is-active");
  },

	showModal: function(event) {
		event.preventDefault();
    if (this.model.id === Doggystyle.currentUserId) {
      var targetModal = event.currentTarget.dataset.modal;
  		$('#'+targetModal).addClass("is-active");
    }
	},

  showInput: function(event) {
    event.preventDefault();
    if (this.model.id === Doggystyle.currentUserId) {
      var targetInput = event.currentTarget.dataset.input;
			$(event.currentTarget).parent().addClass("clicked");
      $('p#'+targetInput).addClass("inactive");
      $('button#'+targetInput).removeClass("inactive");
      $('form#'+targetInput).removeClass("inactive");
    }
  },

  hideInput: function(event) {
    event.preventDefault();
    var targetInput = event.currentTarget.dataset.input;
		$(event.currentTarget).parent().removeClass("clicked");
    $('p#'+targetInput).removeClass("inactive");
    $('form#'+targetInput).addClass("inactive");
    $('button#'+targetInput).addClass("inactive");
  },

	saveBasicInfo: function(event) {
		event.preventDefault();
		attrs = $(event.currentTarget).serializeJSON();
		this.model.save(attrs.user, {patch: true});
	},

  saveLookingForInfo: function(event) {
    event.preventDefault();
    attrs = $(event.currentTarget).serializeJSON();
    $.ajax({
      url: "/api/users/"+this.model.id+"/preferences.json",
      type: "POST",
      data: attrs,
      success: function(results) {
        console.log(results);
      },
    });
		this.model.fetch()
  },

  saveOwnerInfo: function(event) {
    event.preventDefault();
    attrs = $(event.currentTarget).serializeJSON();

    var file = $('.photo-upload')[0].files[0];
    var view = this;
    var formData = new FormData();
    formData.append('new_photo', file);

    debugger
  },

  saveProfileInfo: function(event) {
    event.preventDefault();
    var input = event.currentTarget.dataset.input;
    attrs = $('form#'+input).serializeJSON();
    this.model.save(attrs, {patch: true});
  },


})
