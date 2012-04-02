class RemoveDescriptionFromStoriesAndMeetingFromIterations < ActiveRecord::Migration
  def up
    remove_column :stories, :description
    remove_column :iterations, :meeting
  end

  def down
    add_column :stories, :description, :text
    add_column :iterations, :meeting, :text
  end
end
