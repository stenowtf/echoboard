class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories
end
