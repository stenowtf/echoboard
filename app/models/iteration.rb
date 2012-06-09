class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :stories, through: :stories_in_iterations

  default_scope :order => "id asc"

  accepts_nested_attributes_for :stories_in_iterations, allow_destroy: true

  after_save :update_iteration_current_points, :update_iteration_total_points,
             :update_completed_stories, :update_project_current_points

  private

    def update_iteration_current_points
      value = 0
      self.stories_in_iterations.where("done = ?", true).each do |done_story_in_iteration|
        value += Difficulty.find(Story.find(done_story_in_iteration.story_id).difficulty_id).value
      end
      self.update_column(:iteration_points, value)
    end

    def update_iteration_total_points
      value = 0
      self.stories_in_iterations.each do |story_in_iteration|
        value += Difficulty.find(Story.find(story_in_iteration.story_id).difficulty_id).value
      end
      self.update_column(:total_points, value)
    end

    def update_completed_stories
      self.stories_in_iterations.each do |story_in_iteration|
        if story_in_iteration.done
          Story.find(story_in_iteration.story_id).update_column(:done, true)
        else
          Story.find(story_in_iteration.story_id).update_column(:done, false)
        end
      end
    end

    def update_project_current_points
      value = 0
      Iteration.where("project_id = ?", self.project_id).each do |iteration|
        value += iteration.iteration_points
      end
      self.project.update_column(:current_points, value)
    end
end
