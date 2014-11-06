# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  username                   :string(255)      not null
#  password_digest            :string(255)      not null
#  omniauthid                 :string(255)
#  session_token              :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  gender                     :integer          not null
#  breed                      :integer          not null
#  email                      :string(255)      not null
#  country                    :integer          not null
#  zip                        :integer          not null
#  summary                    :text
#  photo                      :string(255)
#  age                        :integer
#  size                       :integer
#  play_style                 :integer
#  energy_level               :integer
#  owner_name                 :string(255)
#  owner_photo                :string(255)
#  owner_gender               :integer
#  owner_age                  :integer
#  profile_photo_file_name    :string(255)
#  profile_photo_content_type :string(255)
#  profile_photo_file_size    :integer
#  profile_photo_updated_at   :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
