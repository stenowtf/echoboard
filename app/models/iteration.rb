class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :stories, through: :stories_in_iterations

  accepts_nested_attributes_for :stories_in_iterations, allow_destroy: true
end
