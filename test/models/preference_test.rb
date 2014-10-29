# == Schema Information
#
# Table name: preferences
#
#  id                   :integer          not null, primary key
#  user_id              :integer          not null
#  preference_attribute :string(255)      not null
#  value                :integer          not null
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
