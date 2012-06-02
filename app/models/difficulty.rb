class Difficulty < ActiveRecord::Base
  attr_accessible :value
  belongs_to :project
  has_many :stories
end
