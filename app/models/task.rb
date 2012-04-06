class Task < ActiveRecord::Base
  attr_accessible :description, :name, :story_id, :team_id
  belongs_to :story
  belongs_to :team
end
