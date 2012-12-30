# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120621120341) do

  create_table "difficulties", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "value",      :default => 0
  end

  create_table "iterations", :force => true do |t|
    t.datetime "starting_date",      :default => '2012-12-27 17:13:22'
    t.datetime "ending_date",        :default => '2012-12-27 17:13:22'
    t.text     "notes"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "project_id"
    t.integer  "iteration_points",   :default => 0
    t.integer  "total_points",       :default => 0
    t.integer  "estimated_velocity", :default => 0
    t.integer  "actual_velocity",    :default => 0
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "go_live",              :default => '2012-12-27 17:13:22'
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "current_points",       :default => 0
    t.integer  "total_points",         :default => 0
    t.integer  "current_iteration_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "value"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stories", :force => true do |t|
    t.integer  "priority",           :default => 0
    t.string   "name"
    t.text     "definition_of_done"
    t.string   "category"
    t.integer  "difficulty_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "project_id"
    t.boolean  "done",               :default => false
  end

  create_table "stories_in_iterations", :force => true do |t|
    t.integer  "iteration_id"
    t.integer  "story_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "status_id"
    t.boolean  "done",         :default => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "story_id"
    t.integer  "team_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
