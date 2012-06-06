class AddValueToDifficulties < ActiveRecord::Migration
  def change
    add_column :difficulties, :value, :integer
  end
end
