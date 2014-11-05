Doggystyle.Views.UserShowView = Backbone.View.extend({
  tagName: 'section',

  className: 'page-content',

	template: JST['users/show'],

	initialize: function() {
		this.listenTo(this.model, "sync", this.render);
		// this.listenTo(this.collection, "sync", this.render);
	},

	events: {
		"click .js-show-modal": "showModal",
		"click .js-hide-modal": "hideModal",
    "click .js-show-input": "showInput",
    "click .js-hide-input": "hideInput",
    "click .save-user-info": "saveProfileInfo",
		"submit form.basic-info-form": "saveBasicInfo",
    "submit form.looking-for-form": "saveLookingForInfo",
    "submit form.owner-info-form": "saveOwnerInfo",
    "change .photo-upload": "handlePhoto",
	},

	render: function() {
		var renderedContent = this.template({
			user: this.model,
			// users: this.collection,
		});

		this.$el.html(renderedContent);

		return this;
	},

  handlePhoto: function(event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var formData = new FormData();
    formData.append('new_photo', file);
    // var reader = new FileReader();
    // reader.onload = function(e) {
    //   view.model.set('new_photo', this.result);
    // }
    // reader.readAsDataURL(file);
    $.ajax({
      type: 'put',
      url: 'api/users/'+Doggystyle.currentUserId+'/photo',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        console.log(data);
        $('#profile-picture-modal').removeClass('is-active');
        $('.profile-picture > img').attr('src', data)
      }
    });

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
    $('button#'+targetInput).removeClass("inactive");
    $('form#'+targetInput).removeClass("inactive");
  },

  hideInput: function(event) {
    event.preventDefault();
    var targetInput = event.currentTarget.dataset.input;
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

  saveProfileInfo: function(event) {
    event.preventDefault();
    var input = event.currentTarget.dataset.input;
    attrs = $('form#'+input).serializeJSON();
    this.model.save(attrs, {patch: true});
  },


})
