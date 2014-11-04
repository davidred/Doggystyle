Doggystyle.Models.Preference = Backbone.Model.extend({
  urlRoot: "users/preferences",



  genders: {
    0: 'Male', 1: 'Female'
  },

  breeds: {
    0: "Dog",
    1: "Corgi",
    2: "Poodle",
    3: "Husky",
    4: "Boxer"
  },

  countries: {
    1: "USA", 2: "Afghanistan", 3: "Russia"
  },

  sizes: {
    1: "Tiny", 2: "Small", 3: "Medium", 4: "Large"
  },

  playStyles: {
    1: "Chaser", 2: "Tugger", 3: "Wrestler", 4: "Tackler", 5: "Not Sure"
  },

  energyLevels: {
    1: "Super Chill", 2: "Tame", 3: "Likes to party", 4: "Wild Beast"
  },

  play: {
    1: "Friendship", 2: "Casual Play", 3: "Breeding" },

});
