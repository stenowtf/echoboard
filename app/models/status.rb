class Status < ActiveRecord::Base
  attr_accessible :value
  belongs_to :project
  has_many :stories_in_iterations
end
