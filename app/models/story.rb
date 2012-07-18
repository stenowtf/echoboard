class Story < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations, dependent: :destroy
  has_many :iterations, through: :stories_in_iterations
  has_many :tasks, dependent: :destroy
  has_many :teams, through: :tasks

  default_scope :order => "name"

  after_save    :update_project_total_points, :update_iteration_current_points, :update_iteration_total_points
  after_destroy :update_project_total_points, :update_iteration_current_points, :update_iteration_total_points

  private

    def update_project_total_points
      value = 0
      Story.where("project_id = ? and category = ?", self.project_id, "Active").each do |story|
        value += Difficulty.find(story.difficulty_id).value
      end
      self.project.update_column(:total_points, value)
    end

    def update_iteration_current_points
      StoriesInIteration.where("done = ? and story_id = ?", true, self.id).each do |done_story_in_iteration|
        update_other_iterations_current_points(done_story_in_iteration)
      end
    end

    def update_other_iterations_current_points(done_story_in_iteration)
      value = 0
      StoriesInIteration.where("iteration_id = ?", done_story_in_iteration.iteration_id).each do |done_other_story_in_iteration|
        value += Difficulty.find(Story.find(done_other_story_in_iteration.story_id).difficulty_id).value
      end
      Iteration.find(done_story_in_iteration.iteration_id).update_column(:total_points, value)
    end

    def update_iteration_total_points
      StoriesInIteration.where("story_id = ?", self.id).each do |story_in_iteration|
        update_other_iterations_total_points(story_in_iteration)
      end
    end

    def update_other_iterations_total_points(story_in_iteration)
      value = 0
      StoriesInIteration.where("iteration_id = ?", story_in_iteration.iteration_id).each do |other_story_in_iteration|
        value += Difficulty.find(Story.find(other_story_in_iteration.story_id).difficulty_id).value
      end
      Iteration.find(story_in_iteration.iteration_id).update_column(:total_points, value)
    end
end
