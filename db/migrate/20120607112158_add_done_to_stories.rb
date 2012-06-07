class AddDoneToStories < ActiveRecord::Migration
  def change
    add_column :stories, :done, :boolean
  end
end
