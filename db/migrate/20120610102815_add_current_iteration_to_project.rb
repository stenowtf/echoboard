class AddCurrentIterationToProject < ActiveRecord::Migration
  def change
    add_column :projects, :current_iteration_id, :integer
  end
end
