class Story < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :iterations, through: :stories_in_iterations
  has_many :tasks
  has_many :teams, through: :tasks

  default_scope :order => "name asc"
end
