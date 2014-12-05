require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.username { Faker::Internet.user_name }
    f.password { Faker::Internet.password(6) }
    f.email { Faker::Internet.safe_email }
    f.zip { Faker::Address.zip_code }
    f.breed { rand(3) }
    f.gender { rand(2) }
    f.country { rand(4) } 
  end
end
