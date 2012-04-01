class Story < ActiveRecord::Base
  belongs_to :project
  belongs_to :iteration
end
