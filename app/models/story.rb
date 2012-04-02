class Story < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :iterations, :through => :stories_in_iterations
  has_many :teams_in_stories
  has_many :teams, :through => :teams_in_stories
end