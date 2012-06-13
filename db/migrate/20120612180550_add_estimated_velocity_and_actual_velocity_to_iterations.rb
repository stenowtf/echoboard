class AddEstimatedVelocityAndActualVelocityToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :estimated_velocity, :integer
    add_column :iterations, :actual_velocity, :integer
  end
end
