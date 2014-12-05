require 'rails_helper'


# RSpec.describe User, :type => :model do
describe User do
  it "is valid with a username, password, gender, breed, email, country, zip" do
    user = User.new(
      username: "David",
      password: "123456",
      email: "dave",
      gender: 1,
      breed: 2,
      country: 2,
      zip: 11229
    )
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(password: "")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid with a password under 6 characters" do
    user = User.new(password: '12345')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid without a gender"
  it "is invalid without a breed"
  it "is invalid without an email"
  it "is invalid without a country"
end
