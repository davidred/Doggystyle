# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  from       :integer          not null
#  to         :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base

  validates :body, :from, :to, presence: true
  
  belongs_to :sender,
  class_name: "User",
  foreign_key: :from,
  primary_key: :id
  
  belongs_to :receiver,
  class_name: "User",
  foreign_key: :to,
  primary_key: :id

end
