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

ActiveRecord::Schema.define(version: 20161021214551) do

  create_table "groups", force: :cascade do |t|
    t.string   "letter",     limit: 1
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "groups", ["team_id"], name: "index_groups_on_team_id"

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string   "des"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lowerbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lowerbrackets", ["team_id"], name: "index_lowerbrackets_on_team_id"

  create_table "matches", force: :cascade do |t|
    t.date     "date"
    t.boolean  "result"
    t.string   "round",      limit: 2
    t.string   "idgame",     limit: 12
    t.integer  "team_1_id"
    t.integer  "team_2_id"
    t.integer  "phase_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "matches", ["phase_id"], name: "index_matches_on_phase_id"
  add_index "matches", ["team_1_id"], name: "index_matches_on_team_1_id"
  add_index "matches", ["team_2_id"], name: "index_matches_on_team_2_id"

  create_table "performances", force: :cascade do |t|
    t.integer  "games"
    t.integer  "wins"
    t.integer  "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "des"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "lastname"
    t.string   "phone",      limit: 12
    t.integer  "team_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "selecteds", force: :cascade do |t|
    t.integer  "pick_1"
    t.integer  "pick_2"
    t.integer  "pick_3"
    t.integer  "pick_4"
    t.integer  "pick_5"
    t.integer  "match_id"
    t.string   "bando",      limit: 7
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "selecteds", ["match_id"], name: "index_selecteds_on_match_id"
  add_index "selecteds", ["pick_1"], name: "index_selecteds_on_pick_1"
  add_index "selecteds", ["pick_2"], name: "index_selecteds_on_pick_2"
  add_index "selecteds", ["pick_3"], name: "index_selecteds_on_pick_3"
  add_index "selecteds", ["pick_4"], name: "index_selecteds_on_pick_4"
  add_index "selecteds", ["pick_5"], name: "index_selecteds_on_pick_5"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "semester",      limit: 2
    t.integer  "perfomance_id"
    t.integer  "key_id"
    t.integer  "phase_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "teams", ["key_id"], name: "index_teams_on_key_id"
  add_index "teams", ["perfomance_id"], name: "index_teams_on_perfomance_id"
  add_index "teams", ["phase_id"], name: "index_teams_on_phase_id"

  create_table "upperbrackets", force: :cascade do |t|
    t.string   "round",      limit: 2
    t.integer  "team_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "upperbrackets", ["team_id"], name: "index_upperbrackets_on_team_id"

end