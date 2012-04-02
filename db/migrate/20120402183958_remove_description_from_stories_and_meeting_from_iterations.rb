class RemoveDescriptionFromStoriesAndMeetingFromIterations < ActiveRecord::Migration
  def change
    remove_column :stories, :description, :text
    remove_column :iterations, :meeting, :text

  end
end
