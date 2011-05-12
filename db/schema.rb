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

ActiveRecord::Schema.define(:version => 20110511120319) do

  create_table "categories", :force => true do |t|
    t.string "description"
    t.string "image"
  end

  create_table "habit_users", :force => true do |t|
    t.integer "habit_id"
    t.integer "user_id"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
  end

  add_index "habit_users", ["habit_id", "user_id"], :name => "index_habit_users_on_habit_id_and_user_id"

  create_table "habits", :force => true do |t|
    t.integer "category_id"
    t.string  "description"
  end

  add_index "habits", ["category_id"], :name => "index_habits_on_category_id"

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "habit_id"
    t.boolean  "done"
    t.text     "comment"
    t.datetime "date"
  end

  add_index "logs", ["habit_id", "user_id"], :name => "index_logs_on_habit_id_and_user_id"

  create_table "users", :force => true do |t|
    t.string "username", :limit => 25
    t.string "email",    :limit => 30
    t.string "avatar"
  end

end
