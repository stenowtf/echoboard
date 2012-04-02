class TeamsInStory < ActiveRecord::Base
  attr_accessible :story_id, :team_id
  belongs_to :story
  belongs_to :team
end
