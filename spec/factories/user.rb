require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Internet.user_name }
    f.password { Faker::Internet.password(6) }
    f.email = Faker::Internet.safe_email
    f.zip = 11111
    f.breed = 1
    f.gender = 0
    f.country = 2
  end
end
