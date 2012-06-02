class EditStoryAttributes < ActiveRecord::Migration
  def up
    change_table :stories do |t|
      t.rename :estimated_difficulty, :difficulty_id
      t.remove :status
    end
  end

  def down
    change_table :stories do |t|
      t.rename :difficulty_id, :estimated_difficulty
      t.string :status
    end
  end
end
