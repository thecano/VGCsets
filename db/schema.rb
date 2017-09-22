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

ActiveRecord::Schema.define(version: 20161221023626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "country"
    t.string "facebook"
    t.string "twitter"
    t.string "youtube"
    t.string "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemonsets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "specie"
    t.integer "hp"
    t.integer "atk"
    t.integer "defe"
    t.integer "spatk"
    t.integer "spdef"
    t.integer "spd"
    t.integer "item"
    t.integer "nature"
    t.integer "ability"
    t.integer "move1"
    t.integer "move2"
    t.integer "move3"
    t.integer "move4"
    t.text "comment"
    t.boolean "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.integer "creator"
    t.integer "lang", default: 1
    t.string "formato", default: "VGC15"
    t.index ["cached_votes_down"], name: "index_pokemonsets_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_pokemonsets_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_pokemonsets_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_pokemonsets_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_pokemonsets_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_pokemonsets_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_pokemonsets_on_cached_weighted_total"
  end

  create_table "recursos", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.string "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "descripcion"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "pokemon1_id"
    t.integer "pokemon2_id"
    t.integer "pokemon3_id"
    t.integer "pokemon4_id"
    t.integer "pokemon5_id"
    t.integer "pokemon6_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "desc"
  end

  create_table "tops", id: :serial, force: :cascade do |t|
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "team3_id"
    t.integer "team4_id"
    t.integer "team5_id"
    t.integer "team6_id"
    t.integer "team7_id"
    t.integer "team8_id"
    t.string "nombre_torneo"
    t.string "tipo_torneo"
    t.string "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "formato"
    t.date "fecha"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "banned"
    t.boolean "admin"
    t.boolean "mod", default: false
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
