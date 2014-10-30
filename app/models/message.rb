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
