class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :stories, :through => :stories_in_iterations
end