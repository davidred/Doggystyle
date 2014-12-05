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
require 'spec_helper'

# RSpec.describe User, :type => :model do
describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

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
    expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid with a password under 6 characters" do
    user = FactoryGirl.build(:user, password: '12345')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "is invalid without a gender" do
    expect(FactoryGirl.build(:user, gender: nil)).to_not be_valid
  end

  it "is invalid without a breed" do
    expect(FactoryGirl.build(:user, breed: nil)).to_not be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it "is invalid without a country" do
    expect(FactoryGirl.build(:user, country: nil)).to_not be_valid
  end

end
