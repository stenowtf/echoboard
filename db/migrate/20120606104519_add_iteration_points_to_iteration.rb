class AddIterationPointsToIteration < ActiveRecord::Migration
  def change
    add_column :iterations, :iteration_points, :integer
  end
end
