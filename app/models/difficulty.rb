class Difficulty < ActiveRecord::Base
  attr_accessible :value
  belongs_to :project
  has_many :stories

  default_scope :order => "value"
end
