class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :priority
      t.string :name
      t.text :description
      t.text :definition_of_done
      t.string :category
      t.integer :estimated_difficulty
      t.string :status

      t.timestamps
    end
  end
end
