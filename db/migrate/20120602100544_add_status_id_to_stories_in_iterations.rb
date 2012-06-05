class AddStatusIdToStoriesInIterations < ActiveRecord::Migration
  def change
    add_column :stories_in_iterations, :status_id, :integer
    add_column :stories_in_iterations, :done, :boolean
  end
end
