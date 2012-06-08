class Story < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :iterations, through: :stories_in_iterations
  has_many :tasks
  has_many :teams, through: :tasks

  default_scope :order => "name asc"

  after_save :update_total_points

  private

    def update_total_points
      value = 0
      Story.where("project_id = ?", self.project_id).each do |story|
        value += Difficulty.find(story.difficulty_id).value
      end
      self.project.update_column(:total_points, value)
    end
end
