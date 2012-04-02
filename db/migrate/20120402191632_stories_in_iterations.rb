class StoriesInIterations < ActiveRecord::Migration
  def change
    create_table :stories_in_iterations do |t|
      t.integer :iteration_id
      t.integer :story_id

      t.timestamps
    end
  end
end
