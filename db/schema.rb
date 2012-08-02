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

ActiveRecord::Schema.define(:version => 20120802160142) do

  create_table "objective_instances", :force => true do |t|
    t.integer  "quest_instance_id"
    t.integer  "objective_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "objective_instances", ["objective_id"], :name => "index_objective_instances_on_objective_id"
  add_index "objective_instances", ["quest_instance_id"], :name => "index_objective_instances_on_quest_instance_id"

  create_table "objectives", :force => true do |t|
    t.integer  "quest_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "objectives", ["quest_id"], :name => "index_objectives_on_quest_id"

  create_table "quest_instances", :force => true do |t|
    t.integer  "quest_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "quest_instances", ["quest_id"], :name => "index_quest_instances_on_quest_id"
  add_index "quest_instances", ["user_id"], :name => "index_quest_instances_on_user_id"

  create_table "quests", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "quests", ["user_id"], :name => "index_quests_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.binary   "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
