class Team < ActiveRecord::Base
  has_many :teams_in_stories
  has_many :story, :through => :teams_in_stories
end
