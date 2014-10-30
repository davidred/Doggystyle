# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text
#  from       :integer
#  to         :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
