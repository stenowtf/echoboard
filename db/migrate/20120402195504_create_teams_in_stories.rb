class CreateTeamsInStories < ActiveRecord::Migration
  def change
    create_table :teams_in_stories do |t|
      t.integer :story_id
      t.integer :team_id

      t.timestamps
    end
  end
end
