class CreateDifficulties < ActiveRecord::Migration
  def change
    create_table :difficulties do |t|
      t.string :value
      t.integer :project_id

      t.timestamps
    end
  end
end
