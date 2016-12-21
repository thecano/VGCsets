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

ActiveRecord::Schema.define(version: 20161221023626) do

  create_table "ability_names", id: false, force: true do |t|
    t.integer "ability_id",                   null: false
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "ability_names", ["name"], name: "ix_ability_names_name", using: :btree

  create_table "item_names", id: false, force: true do |t|
    t.integer "item_id",                      null: false
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "item_names", ["name"], name: "ix_item_names_name", using: :btree

  create_table "move_names", id: false, force: true do |t|
    t.integer "move_id",                      null: false
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "move_names", ["name"], name: "ix_move_names_name", using: :btree

  create_table "nature_names", id: false, force: true do |t|
    t.integer "nature_id",                    null: false
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "nature_names", ["name"], name: "ix_nature_names_name", using: :btree

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "country"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "youtube"
    t.string   "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pokemon_species_names", id: false, force: true do |t|
    t.integer "pokemon_species_id",            null: false
    t.integer "local_language_id",             null: false
    t.string  "name",               limit: 79
    t.text    "genus"
  end

  add_index "pokemon_species_names", ["name"], name: "ix_pokemon_species_names_name", using: :btree

  create_table "pokemon_stats", id: false, force: true do |t|
    t.integer "pokemon_id", null: false
    t.integer "stat_id",    null: false
    t.integer "base_stat",  null: false
    t.integer "effort",     null: false
  end

  create_table "pokemonsets", force: true do |t|
    t.string   "title"
    t.integer  "specie"
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "defe"
    t.integer  "spatk"
    t.integer  "spdef"
    t.integer  "spd"
    t.integer  "item"
    t.integer  "nature"
    t.integer  "ability"
    t.integer  "move1"
    t.integer  "move2"
    t.integer  "move3"
    t.integer  "move4"
    t.text     "comment"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.integer  "creator"
    t.integer  "lang",                               default: 1
    t.string   "formato",                            default: "VGC15"
  end

  add_index "pokemonsets", ["cached_votes_down"], name: "index_pokemonsets_on_cached_votes_down", using: :btree
  add_index "pokemonsets", ["cached_votes_score"], name: "index_pokemonsets_on_cached_votes_score", using: :btree
  add_index "pokemonsets", ["cached_votes_total"], name: "index_pokemonsets_on_cached_votes_total", using: :btree
  add_index "pokemonsets", ["cached_votes_up"], name: "index_pokemonsets_on_cached_votes_up", using: :btree
  add_index "pokemonsets", ["cached_weighted_average"], name: "index_pokemonsets_on_cached_weighted_average", using: :btree
  add_index "pokemonsets", ["cached_weighted_score"], name: "index_pokemonsets_on_cached_weighted_score", using: :btree
  add_index "pokemonsets", ["cached_weighted_total"], name: "index_pokemonsets_on_cached_weighted_total", using: :btree

  create_table "recursos", force: true do |t|
    t.integer  "team_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descripcion"
  end

  create_table "teams", force: true do |t|
    t.integer  "player_id"
    t.integer  "pokemon1_id"
    t.integer  "pokemon2_id"
    t.integer  "pokemon3_id"
    t.integer  "pokemon4_id"
    t.integer  "pokemon5_id"
    t.integer  "pokemon6_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desc"
  end

  create_table "tops", force: true do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team3_id"
    t.integer  "team4_id"
    t.integer  "team5_id"
    t.integer  "team6_id"
    t.integer  "team7_id"
    t.integer  "team8_id"
    t.string   "nombre_torneo"
    t.string   "tipo_torneo"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "formato"
    t.date     "fecha"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "banned"
    t.boolean  "admin"
    t.boolean  "mod",        default: false
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
