# == Schema Information
#
# Table name: users
#
#  id                               :integer          not null, primary key
#  username                         :string(255)      not null
#  password_digest                  :string(255)      not null
#  omniauthid                       :string(255)
#  session_token                    :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  gender                           :integer          not null
#  breed                            :integer          not null
#  email                            :string(255)      not null
#  country                          :integer          not null
#  zip                              :integer          not null
#  summary                          :text
#  photo                            :string(255)
#  age                              :integer
#  size                             :integer
#  play_style                       :integer
#  energy_level                     :integer
#  owner_name                       :string(255)
#  owner_photo                      :string(255)
#  owner_gender                     :integer
#  owner_age                        :integer
#  profile_photo_file_name          :string(255)
#  profile_photo_content_type       :string(255)
#  profile_photo_file_size          :integer
#  profile_photo_updated_at         :datetime
#  owner_profile_photo_file_name    :string(255)
#  owner_profile_photo_content_type :string(255)
#  owner_profile_photo_file_size    :integer
#  owner_profile_photo_updated_at   :datetime
#

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

  it "is invalid without a gender" do
    user = User.new(gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("can't be blank")
  end

  it "is invalid without a breed" do
    user = User.new(breed: nil)
    user.valid?
    expect(user.errors[:breed]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a country" do
    user = User.new(country: nil)
    user.valid?
    expect(user.errors[:country]).to include("can't be blank")
  end

end
