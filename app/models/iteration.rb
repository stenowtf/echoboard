class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :stories_in_iterations
  has_many :stories, through: :stories_in_iterations

  accepts_nested_attributes_for :stories_in_iterations, allow_destroy: true

  after_save :update_iteration_points, :update_total_points

  private

    def update_iteration_points
      value = 0
      self.stories_in_iterations.where("done = ?", true).each do |done_story_in_iteration|
        value += Difficulty.find(Story.find(done_story_in_iteration.story_id).difficulty_id).value
      end
      self.update_column(:iteration_points, value)
    end

    def update_total_points
      value = 0
      self.stories_in_iterations.each do |story_in_iteration|
        value += Difficulty.find(Story.find(story_in_iteration.story_id).difficulty_id).value
      end
      self.update_column(:total_points, value)
    end
end
