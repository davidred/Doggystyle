require 'faker'

FactoryGirl.define do
  factory :message do |f|
    f.body { Faker::Lorem.paragraph }
    f.to { rand(100) }
    f.from { rand(100) }
  end
end
