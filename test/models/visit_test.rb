# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  visitor    :integer          not null
#  visited    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
