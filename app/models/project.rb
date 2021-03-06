class Project < ActiveRecord::Base
  has_many :stories
  has_many :iterations

  has_many :statuses
  has_many :difficulties

  default_scope :order => "name"

  accepts_nested_attributes_for :statuses,     allow_destroy: true
  accepts_nested_attributes_for :difficulties, allow_destroy: true

  after_save :update_project_total_points, :update_project_current_points

  private

    def update_project_total_points
      value = 0
      Story.where("project_id = ? and category = ?", self.id, "Active").each do |story|
        value += Difficulty.find(story.difficulty_id).value
      end
      self.update_column(:total_points, value)
    end

    def update_project_current_points
      value = 0
      Iteration.where("project_id = ?", self.id).each do |iteration|
        iteration.save!
        value += iteration.iteration_points
      end
      self.update_column(:current_points, value)
    end
end
