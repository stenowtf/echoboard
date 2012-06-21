class AddSomeDefaultsToSomeAttributes < ActiveRecord::Migration
  def up
	change_column_default(:difficulties, :value, 0)
	change_column_default(:iterations, :starting_date, Time.now)
	change_column_default(:iterations, :ending_date, Time.now)
	change_column_default(:iterations, :iteration_points, 0)
	change_column_default(:iterations, :total_points, 0)
	change_column_default(:iterations, :estimated_velocity, 0)
	change_column_default(:iterations, :actual_velocity, 0)
	change_column_default(:projects, :go_live, Time.now)
	change_column_default(:projects, :current_points, 0)
	change_column_default(:projects, :total_points, 0)
	change_column_default(:stories, :priority, 0)
	change_column_default(:stories, :done, false)
	change_column_default(:stories_in_iterations, :done, false)
  end

  def down
    change_column_default(:difficulties, :value, nil)
    change_column_default(:iterations, :starting_date, nil)
    change_column_default(:iterations, :ending_date, nil)
    change_column_default(:iterations, :iteration_points, nil)
    change_column_default(:iterations, :total_points, nil)
    change_column_default(:iterations, :estimated_velocity, nil)
    change_column_default(:iterations, :actual_velocity, nil)
    change_column_default(:projects, :go_live, nil)
    change_column_default(:projects, :current_points, nil)
    change_column_default(:projects, :total_points, nil)
    change_column_default(:stories, :priority, nil)
    change_column_default(:stories, :done, nil)
    change_column_default(:stories_in_iterations, :done, nil)
  end
end
