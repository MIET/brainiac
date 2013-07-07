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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130622143215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "errors", force: true do |t|
    t.string   "prices"
    t.string   "true_answers"
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", force: true do |t|
    t.string   "errors"
    t.string   "prices"
    t.string   "true_answers"
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.string   "true_answers"
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "scores"
    t.string   "parameters"
    t.string   "errors"
    t.string   "prices"
    t.string   "true_answers"
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.string   "parameters"
    t.string   "errors"
    t.string   "prices"
    t.string   "true_answers"
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "true_answers", force: true do |t|
    t.string   "stats"
    t.string   "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
