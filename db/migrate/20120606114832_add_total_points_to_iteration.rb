class AddTotalPointsToIteration < ActiveRecord::Migration
  def change
    add_column :iterations, :total_points, :integer
  end
end
