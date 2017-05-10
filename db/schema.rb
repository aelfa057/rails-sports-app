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

ActiveRecord::Schema.define(version: 20170508193500) do

  create_table "matches", force: :cascade do |t|
    t.date    "match_date"
    t.string  "match_time"
    t.string  "location"
    t.integer "user_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "sport_id"
    t.boolean "completed"
    t.integer "winner_id"
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id"
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id"
  add_index "matches", ["sport_id"], name: "index_matches_on_sport_id"
  add_index "matches", ["winner_id"], name: "index_matches_on_winner_id"

  create_table "reports", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "winner_id_from_home"
    t.integer  "winner_id_from_away"
    t.boolean  "disputed"
    t.integer  "winner_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "home_team_rating"
    t.integer  "away_team_rating"
  end

  create_table "round_matches", force: :cascade do |t|
    t.integer "round_id"
    t.integer "match_id"
    t.integer "winner_id"
  end

  create_table "round_teams", force: :cascade do |t|
    t.integer "round_id"
    t.integer "team_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "round_number"
    t.integer  "teams_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.boolean "captain"
  end

  add_index "team_memberships", ["team_id"], name: "index_team_memberships_on_team_id"
  add_index "team_memberships", ["user_id"], name: "index_team_memberships_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sport_id"
    t.integer  "wins"
    t.integer  "losses"
  end

  add_index "teams", ["sport_id"], name: "index_teams_on_sport_id"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "tournament_teams", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "team_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string  "location"
    t.integer "number_of_teams"
    t.integer "sport_id"
    t.date    "date"
    t.string  "start_time"
    t.string  "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
