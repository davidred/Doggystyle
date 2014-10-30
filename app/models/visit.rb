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

  belongs_to :visiting_user,
  class_name: "User",
  foreign_key: :visitor,
  primary_key: :id

  belongs_to :visited_user,
  class_name: "User",
  foreign_key: :visited,
  primary_key: :id

end
