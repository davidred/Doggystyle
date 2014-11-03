# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Usernames = ['Fancy Fancy', 'Sennacy', 'Pit Bull', 'Ke$ha']
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

Messages = [
             [ #Fancy Fancy's Comments
              [1, "You're a cat, why are you even on this site?"],
              [3, "Ke$ha! Love your I'm so fancy song! I'm so fancyyyy. You already knowwwww.."],
              [3, "Oh wait, that was Iggy Azelea."],
              [3, "Still a great song though. I'm in the fast lane, from LA to Tokyoooooo"]
             ],
             [ #Sennacy's Comments
              [0, "You're all so playful, it's pathetic"],
              [2, "Seriously? Your name is Pit Bull? You're a Poodle"],
              [3, "Why don't you go chase a mailman or pee on something."]
             ],
             [ #Pit Bull's Comments
              [1, "You're so fancy. I think I love you"]
             ],
             [ #Ke$ha's Comments
              [0, "Uhhh. Thanks? Want to play in the park tomorrow?"],
             ]
           ]

USERS = []

Usernames.each_with_index do |username, index|
  user = User.create(username: username,
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
  USERS.push(user)

  user.preferences.create(preference_attribute: "looking_for", value: 1)
  user.preferences.create(preference_attribute: "looking_for", value: 2)
  user.preferences.create(preference_attribute: "looking_for", value: 3)
  user.preferences.create(preference_attribute: "gender", value: 1)
  user.preferences.create(preference_attribute: "gender", value: 2)
  user.preferences.create(preference_attribute: "size", value: 1)
  user.preferences.create(preference_attribute: "size", value: 2)
  user.preferences.create(preference_attribute: "size", value: 3)
  user.preferences.create(preference_attribute: "size", value: 4)
  user.preferences.create(preference_attribute: "breed", value: 0)




end

USERS.each_with_index do |user, index|
  Messages[index].each do |message|
    user.sent_messages.create(body: message[1], to: USERS[message[0]].id)
    user.visited.create(visited: USERS[message[0]].id)
  end
end