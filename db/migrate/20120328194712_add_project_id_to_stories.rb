class AddProjectIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :project_id, :integer

  end
end
