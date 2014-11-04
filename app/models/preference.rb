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

class Preference < ActiveRecord::Base
  validates :user_id, :preference_attribute, :value, presence: true
  validates :user_id, uniqueness: { scope: [:preference_attribute, :value] }

  belongs_to :user

  scope :user_ID, -> (user_ID) { where("user_id = ?", user_ID) }
end
