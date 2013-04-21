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

ActiveRecord::Schema.define(:version => 20130421133520) do

  create_table "gpios", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "pin"
    t.boolean  "direction"
    t.integer  "robot_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "default_value"
    t.boolean  "value"
  end

  create_table "operations", :force => true do |t|
    t.integer  "robot_id"
    t.string   "name"
    t.text     "description"
    t.integer  "time_max"
    t.integer  "state_to_send_id"
    t.integer  "state_asked_id"
    t.integer  "operation_error_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "registers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "value"
    t.string   "last_value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "robot_id"
    t.string   "default_value"
  end

  create_table "robots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "fpga_adress"
  end

  create_table "status_gpios", :force => true do |t|
    t.integer  "gpio_id"
    t.boolean  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status_id"
  end

  create_table "status_registers", :force => true do |t|
    t.integer  "register_id"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "status_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "robot_id"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "robot_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks_lists", :force => true do |t|
    t.integer  "operation_id"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "task_id"
  end

  create_table "working_operations", :force => true do |t|
    t.integer  "robot_id"
    t.datetime "run_until"
    t.datetime "started_at"
    t.integer  "operation_id"
    t.string   "status"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
