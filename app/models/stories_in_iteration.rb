class StoriesInIteration < ActiveRecord::Base
  belongs_to :iteration
  belongs_to :story

  default_scope :order => "iteration_id"
end
