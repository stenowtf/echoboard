class Project < ActiveRecord::Base
  has_many :stories
  has_many :iterations

  has_many :statuses
  has_many :difficulties

  accepts_nested_attributes_for :statuses,     allow_destroy: true
  accepts_nested_attributes_for :difficulties, allow_destroy: true

  after_save :update_total_points

  private

    def update_total_points
      value = 0
      Story.where("project_id = ?", self.id).each do |story|
        value += Difficulty.find(story.difficulty_id).value
      end
      self.update_column(:total_points, value)
    end
end
