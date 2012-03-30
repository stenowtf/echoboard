class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.datetime :starting_date
      t.datetime :ending_date
      t.text :notes
      t.text :meeting

      t.timestamps
    end
  end
end
