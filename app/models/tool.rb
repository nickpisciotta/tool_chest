class Tool < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  belongs_to :category 

end
