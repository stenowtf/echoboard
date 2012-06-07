class ChangeDifficultyValueInInteger < ActiveRecord::Migration
  def up
    change_table :difficulties do |t|
      t.remove :value
    end
  end

  def down
    change_table :difficulties do |t|
      t.column :value, :string
    end
  end
end
