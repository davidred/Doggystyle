class Visit < ActiveRecord::Base
  
  validates :visitor, :visited, presence: true
  
end
