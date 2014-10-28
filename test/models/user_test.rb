# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  username             :string(255)      not null
#  password_digest      :string(255)      not null
#  session_token        :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  gender               :integer          not null
#  breed                :integer          not null
#  email                :string(255)      not null
#  country              :string(255)      not null
#  zip                  :integer          not null
#  summary              :text
#  photo                :string(255)
#  age                  :integer
#  size                 :integer
#  play_style           :integer
#  energy_level         :integer
#  looking_for_size     :integer
#  looking_for_breed    :integer
#  looking_for_gender   :integer
#  looking_for_distance :integer
#  looking_for_location :integer
#  owner_name           :string(255)
#  owner_photo          :string(255)
#  owner_gender         :integer
#  owner_age            :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
