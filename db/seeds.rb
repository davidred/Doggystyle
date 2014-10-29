# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Usernames = ['Fancy Fancy', 'Sennacy', 'Pit Bull', 'Kesha']
Breeds = [1, 2, 3, 4]
Countries = [1, 1, 2, 3 ]
Genders = [1, 2, 1, 2]
Summaries = ["I'm a fancy poodle", "I'm a cat. I hate dogs.", "I'm Mr. Worldwide", "We are who we are"]
Photos = ["corgi", "poodle", "husky", "boxer"]
Ages = [1, 2, 3, 1]
Sizes = [1, 1, 3, 2]
Playstyles = [1, 1, 2, 3]
Energylevels = [1, 1, 2, 3]
PreferenceAttrs = [:breed, :size, :gender]



Usernames.each_with_index do |username, index|
  u1 = User.create(username: username,
                   password: '123456',
                   email: username + '@aol.com',
                   breed: Breeds[index],
                   gender: Genders[index],
                   zip: 11229,
                   country: Countries[index],
                   summary: Summaries[index],
                   photo: Photos[index],
                   age: Ages[index],
                   size: Sizes[index],
                   play_style: Playstyles[index],
                   energy_level: Energylevels[index],
                   owner_name: Photos[index] + 'owner',
                   owner_photo: Photos[index] + 'owner',
                   owner_gender: Genders[index],
                   owner_age: 25,
                    )
  # rand(2).times do
  p1 = u1.preferences.create(preference_attribute: PreferenceAttrs[0], value: Breeds[rand(Breeds.length + 1)])
 #  # end
 #
  p2 = u1.preferences.create(preference_attribute: PreferenceAttrs[1], value: Sizes[rand(Sizes.length + 1)])
  p3 = u1.preferences.create(preference_attribute: PreferenceAttrs[2], value:rand(2))

end