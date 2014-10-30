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

class Visit < ActiveRecord::Base
  
  validates :visitor, :visited, presence: true
  
end
