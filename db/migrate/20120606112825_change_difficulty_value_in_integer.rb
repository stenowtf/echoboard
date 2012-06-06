class ChangeDifficultyValueInInteger < ActiveRecord::Migration
  def up
    change_table :difficulties do |t|
      t.change :value, :integer
    end
  end

  def down
    change_table :stories do |t|
      t.change :value, :string
    end
  end
end
