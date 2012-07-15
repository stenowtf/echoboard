class Story < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations, dependent: :destroy
  has_many :iterations, through: :stories_in_iterations
  has_many :tasks, dependent: :destroy
  has_many :teams, through: :tasks

  default_scope :order => "name"

  after_save    :update_project_total_points
  after_destroy :update_project_total_points

  private

    def update_project_total_points
      value = 0
      Story.where("project_id = ? and category = ?", self.project_id, "Active").each do |story|
        value += Difficulty.find(story.difficulty_id).value
      end
      self.project.update_column(:total_points, value)
    end
end
