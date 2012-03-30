class AddProjectIdToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :project_id, :integer

  end
end
