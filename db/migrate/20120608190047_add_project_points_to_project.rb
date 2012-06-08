class AddProjectPointsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :current_points, :integer
    add_column :projects, :total_points, :integer
  end
end
