class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :go_live

      t.timestamps
    end
  end
end
