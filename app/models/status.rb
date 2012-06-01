class Status < ActiveRecord::Base
  attr_accessible :value
  belongs_to :project
end
