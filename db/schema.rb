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

ActiveRecord::Schema.define(version: 20141021185543) do

  create_table "abilities", force: true do |t|
    t.string  "identifier",     limit: 79, null: false
    t.integer "generation_id",             null: false
    t.boolean "is_main_series",            null: false
  end

  add_index "abilities", ["is_main_series"], name: "ix_abilities_is_main_series"

  create_table "ability_changelog", force: true do |t|
    t.integer "ability_id",                  null: false
    t.integer "changed_in_version_group_id", null: false
  end

  create_table "ability_changelog_prose", primary_key: "ability_changelog_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "effect",            null: false
  end

  add_index "ability_changelog_prose", ["ability_changelog_id", "local_language_id"], name: "sqlite_autoindex_ability_changelog_prose_1", unique: true

  create_table "ability_flavor_text", primary_key: "ability_id", force: true do |t|
    t.integer "version_group_id", null: false
    t.integer "language_id",      null: false
    t.text    "flavor_text",      null: false
  end

  add_index "ability_flavor_text", ["ability_id", "version_group_id", "language_id"], name: "sqlite_autoindex_ability_flavor_text_1", unique: true

  create_table "ability_names", primary_key: "ability_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "ability_names", ["ability_id", "local_language_id"], name: "sqlite_autoindex_ability_names_1", unique: true
  add_index "ability_names", ["name"], name: "ix_ability_names_name"

  create_table "ability_prose", primary_key: "ability_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "short_effect"
    t.text    "effect"
  end

  add_index "ability_prose", ["ability_id", "local_language_id"], name: "sqlite_autoindex_ability_prose_1", unique: true

  create_table "berries", force: true do |t|
    t.integer "item_id",              null: false
    t.integer "firmness_id",          null: false
    t.integer "natural_gift_power"
    t.integer "natural_gift_type_id"
    t.integer "size",                 null: false
    t.integer "max_harvest",          null: false
    t.integer "growth_time",          null: false
    t.integer "soil_dryness",         null: false
    t.integer "smoothness",           null: false
  end

  create_table "berry_firmness", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "berry_firmness_names", primary_key: "berry_firmness_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "berry_firmness_names", ["berry_firmness_id", "local_language_id"], name: "sqlite_autoindex_berry_firmness_names_1", unique: true
  add_index "berry_firmness_names", ["name"], name: "ix_berry_firmness_names_name"

  create_table "berry_flavors", primary_key: "berry_id", force: true do |t|
    t.integer "contest_type_id", null: false
    t.integer "flavor",          null: false
  end

  add_index "berry_flavors", ["berry_id", "contest_type_id"], name: "sqlite_autoindex_berry_flavors_1", unique: true

  create_table "characteristic_text", primary_key: "characteristic_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "message",           limit: 79, null: false
  end

  add_index "characteristic_text", ["characteristic_id", "local_language_id"], name: "sqlite_autoindex_characteristic_text_1", unique: true
  add_index "characteristic_text", ["message"], name: "ix_characteristic_text_message"

  create_table "characteristics", force: true do |t|
    t.integer "stat_id",    null: false
    t.integer "gene_mod_5", null: false
  end

  add_index "characteristics", ["gene_mod_5"], name: "ix_characteristics_gene_mod_5"

  create_table "conquest_episode_names", primary_key: "episode_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_episode_names", ["episode_id", "local_language_id"], name: "sqlite_autoindex_conquest_episode_names_1", unique: true
  add_index "conquest_episode_names", ["name"], name: "ix_conquest_episode_names_name"

  create_table "conquest_episode_warriors", primary_key: "episode_id", force: true do |t|
    t.integer "warrior_id", null: false
  end

  add_index "conquest_episode_warriors", ["episode_id", "warrior_id"], name: "sqlite_autoindex_conquest_episode_warriors_1", unique: true

  create_table "conquest_episodes", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_kingdom_names", primary_key: "kingdom_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_kingdom_names", ["kingdom_id", "local_language_id"], name: "sqlite_autoindex_conquest_kingdom_names_1", unique: true
  add_index "conquest_kingdom_names", ["name"], name: "ix_conquest_kingdom_names_name"

  create_table "conquest_kingdoms", force: true do |t|
    t.string  "identifier", limit: 79, null: false
    t.integer "type_id",               null: false
  end

  create_table "conquest_max_links", primary_key: "warrior_rank_id", force: true do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "max_link",           null: false
  end

  add_index "conquest_max_links", ["warrior_rank_id", "pokemon_species_id"], name: "sqlite_autoindex_conquest_max_links_1", unique: true

  create_table "conquest_move_data", primary_key: "move_id", force: true do |t|
    t.integer "power"
    t.integer "accuracy"
    t.integer "effect_chance"
    t.integer "effect_id",       null: false
    t.integer "range_id",        null: false
    t.integer "displacement_id"
  end

  create_table "conquest_move_displacement_prose", primary_key: "move_displacement_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "short_effect"
    t.text    "effect"
  end

  add_index "conquest_move_displacement_prose", ["move_displacement_id", "local_language_id"], name: "sqlite_autoindex_conquest_move_displacement_prose_1", unique: true

  create_table "conquest_move_displacements", force: true do |t|
    t.string  "identifier",     limit: 79, null: false
    t.boolean "affects_target",            null: false
  end

  create_table "conquest_move_effect_prose", primary_key: "conquest_move_effect_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "short_effect"
    t.text    "effect"
  end

  add_index "conquest_move_effect_prose", ["conquest_move_effect_id", "local_language_id"], name: "sqlite_autoindex_conquest_move_effect_prose_1", unique: true

  create_table "conquest_move_effects", force: true do |t|
  end

  create_table "conquest_move_range_prose", primary_key: "conquest_move_range_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "conquest_move_range_prose", ["conquest_move_range_id", "local_language_id"], name: "sqlite_autoindex_conquest_move_range_prose_1", unique: true

  create_table "conquest_move_ranges", force: true do |t|
    t.string  "identifier", limit: 79, null: false
    t.integer "targets",               null: false
  end

  create_table "conquest_pokemon_abilities", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "slot",       null: false
    t.integer "ability_id", null: false
  end

  add_index "conquest_pokemon_abilities", ["pokemon_species_id", "slot"], name: "sqlite_autoindex_conquest_pokemon_abilities_1", unique: true

  create_table "conquest_pokemon_evolution", primary_key: "evolved_species_id", force: true do |t|
    t.integer "required_stat_id"
    t.integer "minimum_stat"
    t.integer "minimum_link"
    t.integer "kingdom_id"
    t.integer "warrior_gender_id"
    t.integer "item_id"
    t.boolean "recruiting_ko_required", null: false
  end

  create_table "conquest_pokemon_moves", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "move_id", null: false
  end

  create_table "conquest_pokemon_stats", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "conquest_stat_id", null: false
    t.integer "base_stat",        null: false
  end

  add_index "conquest_pokemon_stats", ["pokemon_species_id", "conquest_stat_id"], name: "sqlite_autoindex_conquest_pokemon_stats_1", unique: true

  create_table "conquest_stat_names", primary_key: "conquest_stat_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_stat_names", ["conquest_stat_id", "local_language_id"], name: "sqlite_autoindex_conquest_stat_names_1", unique: true
  add_index "conquest_stat_names", ["name"], name: "ix_conquest_stat_names_name"

  create_table "conquest_stats", force: true do |t|
    t.string  "identifier", limit: 79, null: false
    t.boolean "is_base",               null: false
  end

  create_table "conquest_transformation_pokemon", primary_key: "transformation_id", force: true do |t|
    t.integer "pokemon_species_id", null: false
  end

  add_index "conquest_transformation_pokemon", ["transformation_id", "pokemon_species_id"], name: "sqlite_autoindex_conquest_transformation_pokemon_1", unique: true

  create_table "conquest_transformation_warriors", primary_key: "transformation_id", force: true do |t|
    t.integer "present_warrior_id", null: false
  end

  add_index "conquest_transformation_warriors", ["transformation_id", "present_warrior_id"], name: "sqlite_autoindex_conquest_transformation_warriors_1", unique: true

  create_table "conquest_warrior_archetypes", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_names", primary_key: "warrior_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_warrior_names", ["name"], name: "ix_conquest_warrior_names_name"
  add_index "conquest_warrior_names", ["warrior_id", "local_language_id"], name: "sqlite_autoindex_conquest_warrior_names_1", unique: true

  create_table "conquest_warrior_rank_stat_map", primary_key: "warrior_rank_id", force: true do |t|
    t.integer "warrior_stat_id", null: false
    t.integer "base_stat",       null: false
  end

  add_index "conquest_warrior_rank_stat_map", ["warrior_rank_id", "warrior_stat_id"], name: "sqlite_autoindex_conquest_warrior_rank_stat_map_1", unique: true

  create_table "conquest_warrior_ranks", force: true do |t|
    t.integer "warrior_id", null: false
    t.integer "rank",       null: false
    t.integer "skill_id",   null: false
  end

  add_index "conquest_warrior_ranks", ["warrior_id", "rank"], name: "sqlite_autoindex_conquest_warrior_ranks_1", unique: true

  create_table "conquest_warrior_skill_names", primary_key: "skill_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_warrior_skill_names", ["name"], name: "ix_conquest_warrior_skill_names_name"
  add_index "conquest_warrior_skill_names", ["skill_id", "local_language_id"], name: "sqlite_autoindex_conquest_warrior_skill_names_1", unique: true

  create_table "conquest_warrior_skills", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_specialties", primary_key: "warrior_id", force: true do |t|
    t.integer "type_id", null: false
    t.integer "slot",    null: false
  end

  add_index "conquest_warrior_specialties", ["warrior_id", "type_id", "slot"], name: "sqlite_autoindex_conquest_warrior_specialties_1", unique: true

  create_table "conquest_warrior_stat_names", primary_key: "warrior_stat_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "conquest_warrior_stat_names", ["name"], name: "ix_conquest_warrior_stat_names_name"
  add_index "conquest_warrior_stat_names", ["warrior_stat_id", "local_language_id"], name: "sqlite_autoindex_conquest_warrior_stat_names_1", unique: true

  create_table "conquest_warrior_stats", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_transformation", primary_key: "transformed_warrior_rank_id", force: true do |t|
    t.boolean "is_automatic",         null: false
    t.integer "required_link"
    t.integer "completed_episode_id"
    t.integer "current_episode_id"
    t.integer "distant_warrior_id"
    t.integer "female_warlord_count"
    t.integer "pokemon_count"
    t.integer "collection_type_id"
    t.integer "warrior_count"
  end

  create_table "conquest_warriors", force: true do |t|
    t.string  "identifier",   limit: 79, null: false
    t.integer "gender_id",               null: false
    t.integer "archetype_id"
  end

  create_table "contest_combos", primary_key: "first_move_id", force: true do |t|
    t.integer "second_move_id", null: false
  end

  add_index "contest_combos", ["first_move_id", "second_move_id"], name: "sqlite_autoindex_contest_combos_1", unique: true

  create_table "contest_effect_prose", primary_key: "contest_effect_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "flavor_text"
    t.text    "effect"
  end

  add_index "contest_effect_prose", ["contest_effect_id", "local_language_id"], name: "sqlite_autoindex_contest_effect_prose_1", unique: true

  create_table "contest_effects", force: true do |t|
    t.integer "appeal", null: false
    t.integer "jam",    null: false
  end

  create_table "contest_type_names", primary_key: "contest_type_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "flavor"
    t.text    "color"
  end

  add_index "contest_type_names", ["contest_type_id", "local_language_id"], name: "sqlite_autoindex_contest_type_names_1", unique: true
  add_index "contest_type_names", ["name"], name: "ix_contest_type_names_name"

  create_table "contest_types", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "egg_group_prose", primary_key: "egg_group_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "egg_group_prose", ["egg_group_id", "local_language_id"], name: "sqlite_autoindex_egg_group_prose_1", unique: true
  add_index "egg_group_prose", ["name"], name: "ix_egg_group_prose_name"

  create_table "egg_groups", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "encounter_condition_prose", primary_key: "encounter_condition_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "encounter_condition_prose", ["encounter_condition_id", "local_language_id"], name: "sqlite_autoindex_encounter_condition_prose_1", unique: true
  add_index "encounter_condition_prose", ["name"], name: "ix_encounter_condition_prose_name"

  create_table "encounter_condition_value_map", primary_key: "encounter_id", force: true do |t|
    t.integer "encounter_condition_value_id", null: false
  end

  add_index "encounter_condition_value_map", ["encounter_id", "encounter_condition_value_id"], name: "sqlite_autoindex_encounter_condition_value_map_1", unique: true

  create_table "encounter_condition_value_prose", primary_key: "encounter_condition_value_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "encounter_condition_value_prose", ["encounter_condition_value_id", "local_language_id"], name: "sqlite_autoindex_encounter_condition_value_prose_1", unique: true
  add_index "encounter_condition_value_prose", ["name"], name: "ix_encounter_condition_value_prose_name"

  create_table "encounter_condition_values", force: true do |t|
    t.integer "encounter_condition_id",            null: false
    t.string  "identifier",             limit: 79, null: false
    t.boolean "is_default",                        null: false
  end

  create_table "encounter_conditions", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "encounter_method_prose", primary_key: "encounter_method_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "encounter_method_prose", ["encounter_method_id", "local_language_id"], name: "sqlite_autoindex_encounter_method_prose_1", unique: true
  add_index "encounter_method_prose", ["name"], name: "ix_encounter_method_prose_name"

  create_table "encounter_methods", force: true do |t|
    t.string  "identifier", limit: 79, null: false
    t.integer "order",                 null: false
  end

  add_index "encounter_methods", ["identifier"], name: "sqlite_autoindex_encounter_methods_1", unique: true
  add_index "encounter_methods", ["order"], name: "sqlite_autoindex_encounter_methods_2", unique: true

  create_table "encounter_slots", force: true do |t|
    t.integer "version_group_id",    null: false
    t.integer "encounter_method_id", null: false
    t.integer "slot"
    t.integer "rarity"
  end

  create_table "encounters", force: true do |t|
    t.integer "version_id",        null: false
    t.integer "location_area_id",  null: false
    t.integer "encounter_slot_id", null: false
    t.integer "pokemon_id",        null: false
    t.integer "min_level",         null: false
    t.integer "max_level",         null: false
  end

  create_table "evolution_chains", force: true do |t|
    t.integer "baby_trigger_item_id"
  end

  create_table "evolution_trigger_prose", primary_key: "evolution_trigger_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "evolution_trigger_prose", ["evolution_trigger_id", "local_language_id"], name: "sqlite_autoindex_evolution_trigger_prose_1", unique: true
  add_index "evolution_trigger_prose", ["name"], name: "ix_evolution_trigger_prose_name"

  create_table "evolution_triggers", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "experience", primary_key: "growth_rate_id", force: true do |t|
    t.integer "level",      null: false
    t.integer "experience", null: false
  end

  add_index "experience", ["growth_rate_id", "level"], name: "sqlite_autoindex_experience_1", unique: true

  create_table "genders", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "generation_names", primary_key: "generation_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "generation_names", ["generation_id", "local_language_id"], name: "sqlite_autoindex_generation_names_1", unique: true
  add_index "generation_names", ["name"], name: "ix_generation_names_name"

  create_table "generations", force: true do |t|
    t.integer "main_region_id",            null: false
    t.string  "identifier",     limit: 79, null: false
  end

  create_table "growth_rate_prose", primary_key: "growth_rate_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "growth_rate_prose", ["growth_rate_id", "local_language_id"], name: "sqlite_autoindex_growth_rate_prose_1", unique: true
  add_index "growth_rate_prose", ["name"], name: "ix_growth_rate_prose_name"

  create_table "growth_rates", force: true do |t|
    t.string "identifier", limit: 79, null: false
    t.text   "formula",               null: false
  end

  create_table "item_categories", force: true do |t|
    t.integer "pocket_id",             null: false
    t.string  "identifier", limit: 79, null: false
  end

  create_table "item_category_prose", primary_key: "item_category_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "item_category_prose", ["item_category_id", "local_language_id"], name: "sqlite_autoindex_item_category_prose_1", unique: true
  add_index "item_category_prose", ["name"], name: "ix_item_category_prose_name"

  create_table "item_flag_map", primary_key: "item_id", force: true do |t|
    t.integer "item_flag_id", null: false
  end

  add_index "item_flag_map", ["item_id", "item_flag_id"], name: "sqlite_autoindex_item_flag_map_1", unique: true

  create_table "item_flag_prose", primary_key: "item_flag_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "item_flag_prose", ["item_flag_id", "local_language_id"], name: "sqlite_autoindex_item_flag_prose_1", unique: true
  add_index "item_flag_prose", ["name"], name: "ix_item_flag_prose_name"

  create_table "item_flags", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "item_flavor_summaries", primary_key: "item_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "flavor_summary"
  end

  add_index "item_flavor_summaries", ["item_id", "local_language_id"], name: "sqlite_autoindex_item_flavor_summaries_1", unique: true

  create_table "item_flavor_text", primary_key: "item_id", force: true do |t|
    t.integer "version_group_id", null: false
    t.integer "language_id",      null: false
    t.text    "flavor_text",      null: false
  end

  add_index "item_flavor_text", ["item_id", "version_group_id", "language_id"], name: "sqlite_autoindex_item_flavor_text_1", unique: true

  create_table "item_fling_effect_prose", primary_key: "item_fling_effect_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "effect",            null: false
  end

  add_index "item_fling_effect_prose", ["item_fling_effect_id", "local_language_id"], name: "sqlite_autoindex_item_fling_effect_prose_1", unique: true

  create_table "item_fling_effects", force: true do |t|
  end

  create_table "item_game_indices", primary_key: "item_id", force: true do |t|
    t.integer "generation_id", null: false
    t.integer "game_index",    null: false
  end

  add_index "item_game_indices", ["item_id", "generation_id"], name: "sqlite_autoindex_item_game_indices_1", unique: true

  create_table "item_names", primary_key: "item_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "item_names", ["item_id", "local_language_id"], name: "sqlite_autoindex_item_names_1", unique: true
  add_index "item_names", ["name"], name: "ix_item_names_name"

  create_table "item_pocket_names", primary_key: "item_pocket_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "item_pocket_names", ["item_pocket_id", "local_language_id"], name: "sqlite_autoindex_item_pocket_names_1", unique: true
  add_index "item_pocket_names", ["name"], name: "ix_item_pocket_names_name"

  create_table "item_pockets", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "item_prose", primary_key: "item_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "short_effect"
    t.text    "effect"
  end

  add_index "item_prose", ["item_id", "local_language_id"], name: "sqlite_autoindex_item_prose_1", unique: true

  create_table "items", force: true do |t|
    t.string  "identifier",      limit: 79, null: false
    t.integer "category_id",                null: false
    t.integer "cost",                       null: false
    t.integer "fling_power"
    t.integer "fling_effect_id"
  end

  create_table "language_names", primary_key: "language_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "language_names", ["language_id", "local_language_id"], name: "sqlite_autoindex_language_names_1", unique: true
  add_index "language_names", ["name"], name: "ix_language_names_name"

  create_table "languages", force: true do |t|
    t.string  "iso639",     limit: 79, null: false
    t.string  "iso3166",    limit: 79, null: false
    t.string  "identifier", limit: 79, null: false
    t.boolean "official",              null: false
    t.integer "order"
  end

  add_index "languages", ["official"], name: "ix_languages_official"

  create_table "location_area_encounter_rates", primary_key: "location_area_id", force: true do |t|
    t.integer "encounter_method_id", null: false
    t.integer "version_id",          null: false
    t.integer "rate"
  end

  add_index "location_area_encounter_rates", ["location_area_id", "encounter_method_id", "version_id"], name: "sqlite_autoindex_location_area_encounter_rates_1", unique: true

  create_table "location_area_prose", primary_key: "location_area_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
  end

  add_index "location_area_prose", ["location_area_id", "local_language_id"], name: "sqlite_autoindex_location_area_prose_1", unique: true
  add_index "location_area_prose", ["name"], name: "ix_location_area_prose_name"

  create_table "location_areas", force: true do |t|
    t.integer "location_id",            null: false
    t.integer "game_index",             null: false
    t.string  "identifier",  limit: 79
  end

  create_table "location_game_indices", primary_key: "location_id", force: true do |t|
    t.integer "generation_id", null: false
    t.integer "game_index",    null: false
  end

  add_index "location_game_indices", ["location_id", "generation_id", "game_index"], name: "sqlite_autoindex_location_game_indices_1", unique: true

  create_table "location_names", primary_key: "location_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "location_names", ["location_id", "local_language_id"], name: "sqlite_autoindex_location_names_1", unique: true
  add_index "location_names", ["name"], name: "ix_location_names_name"

  create_table "locations", force: true do |t|
    t.integer "region_id"
    t.string  "identifier", limit: 79, null: false
  end

  create_table "machines", primary_key: "machine_number", force: true do |t|
    t.integer "version_group_id", null: false
    t.integer "item_id",          null: false
    t.integer "move_id",          null: false
  end

  add_index "machines", ["machine_number", "version_group_id"], name: "sqlite_autoindex_machines_1", unique: true

  create_table "move_battle_style_prose", primary_key: "move_battle_style_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "move_battle_style_prose", ["move_battle_style_id", "local_language_id"], name: "sqlite_autoindex_move_battle_style_prose_1", unique: true
  add_index "move_battle_style_prose", ["name"], name: "ix_move_battle_style_prose_name"

  create_table "move_battle_styles", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_changelog", primary_key: "move_id", force: true do |t|
    t.integer "changed_in_version_group_id", null: false
    t.integer "type_id"
    t.integer "power"
    t.integer "pp"
    t.integer "accuracy"
    t.integer "effect_id"
    t.integer "effect_chance"
  end

  add_index "move_changelog", ["move_id", "changed_in_version_group_id"], name: "sqlite_autoindex_move_changelog_1", unique: true

  create_table "move_damage_class_prose", primary_key: "move_damage_class_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "move_damage_class_prose", ["move_damage_class_id", "local_language_id"], name: "sqlite_autoindex_move_damage_class_prose_1", unique: true
  add_index "move_damage_class_prose", ["name"], name: "ix_move_damage_class_prose_name"

  create_table "move_damage_classes", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_effect_changelog", force: true do |t|
    t.integer "effect_id",                   null: false
    t.integer "changed_in_version_group_id", null: false
  end

  add_index "move_effect_changelog", ["effect_id", "changed_in_version_group_id"], name: "sqlite_autoindex_move_effect_changelog_1", unique: true

  create_table "move_effect_changelog_prose", primary_key: "move_effect_changelog_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "effect",            null: false
  end

  add_index "move_effect_changelog_prose", ["move_effect_changelog_id", "local_language_id"], name: "sqlite_autoindex_move_effect_changelog_prose_1", unique: true

  create_table "move_effect_prose", primary_key: "move_effect_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "short_effect"
    t.text    "effect"
  end

  add_index "move_effect_prose", ["move_effect_id", "local_language_id"], name: "sqlite_autoindex_move_effect_prose_1", unique: true

  create_table "move_effects", force: true do |t|
  end

  create_table "move_flag_map", primary_key: "move_id", force: true do |t|
    t.integer "move_flag_id", null: false
  end

  add_index "move_flag_map", ["move_id", "move_flag_id"], name: "sqlite_autoindex_move_flag_map_1", unique: true

  create_table "move_flag_prose", primary_key: "move_flag_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "move_flag_prose", ["move_flag_id", "local_language_id"], name: "sqlite_autoindex_move_flag_prose_1", unique: true
  add_index "move_flag_prose", ["name"], name: "ix_move_flag_prose_name"

  create_table "move_flags", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_flavor_summaries", primary_key: "move_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "flavor_summary"
  end

  add_index "move_flavor_summaries", ["move_id", "local_language_id"], name: "sqlite_autoindex_move_flavor_summaries_1", unique: true

  create_table "move_flavor_text", primary_key: "move_id", force: true do |t|
    t.integer "version_group_id", null: false
    t.integer "language_id",      null: false
    t.text    "flavor_text",      null: false
  end

  add_index "move_flavor_text", ["move_id", "version_group_id", "language_id"], name: "sqlite_autoindex_move_flavor_text_1", unique: true

  create_table "move_meta", primary_key: "move_id", force: true do |t|
    t.integer "meta_category_id", null: false
    t.integer "meta_ailment_id",  null: false
    t.integer "min_hits"
    t.integer "max_hits"
    t.integer "min_turns"
    t.integer "max_turns"
    t.integer "drain",            null: false
    t.integer "healing",          null: false
    t.integer "crit_rate",        null: false
    t.integer "ailment_chance",   null: false
    t.integer "flinch_chance",    null: false
    t.integer "stat_chance",      null: false
  end

  add_index "move_meta", ["ailment_chance"], name: "ix_move_meta_ailment_chance"
  add_index "move_meta", ["crit_rate"], name: "ix_move_meta_crit_rate"
  add_index "move_meta", ["drain"], name: "ix_move_meta_drain"
  add_index "move_meta", ["flinch_chance"], name: "ix_move_meta_flinch_chance"
  add_index "move_meta", ["healing"], name: "ix_move_meta_healing"
  add_index "move_meta", ["max_hits"], name: "ix_move_meta_max_hits"
  add_index "move_meta", ["max_turns"], name: "ix_move_meta_max_turns"
  add_index "move_meta", ["min_hits"], name: "ix_move_meta_min_hits"
  add_index "move_meta", ["min_turns"], name: "ix_move_meta_min_turns"
  add_index "move_meta", ["stat_chance"], name: "ix_move_meta_stat_chance"

  create_table "move_meta_ailment_names", primary_key: "move_meta_ailment_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "move_meta_ailment_names", ["move_meta_ailment_id", "local_language_id"], name: "sqlite_autoindex_move_meta_ailment_names_1", unique: true
  add_index "move_meta_ailment_names", ["name"], name: "ix_move_meta_ailment_names_name"

  create_table "move_meta_ailments", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  add_index "move_meta_ailments", ["identifier"], name: "ix_move_meta_ailments_identifier", unique: true

  create_table "move_meta_categories", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  add_index "move_meta_categories", ["identifier"], name: "ix_move_meta_categories_identifier", unique: true

  create_table "move_meta_category_prose", primary_key: "move_meta_category_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "description",       null: false
  end

  add_index "move_meta_category_prose", ["move_meta_category_id", "local_language_id"], name: "sqlite_autoindex_move_meta_category_prose_1", unique: true

  create_table "move_meta_stat_changes", primary_key: "move_id", force: true do |t|
    t.integer "stat_id", null: false
    t.integer "change",  null: false
  end

  add_index "move_meta_stat_changes", ["change"], name: "ix_move_meta_stat_changes_change"
  add_index "move_meta_stat_changes", ["move_id", "stat_id"], name: "sqlite_autoindex_move_meta_stat_changes_1", unique: true

  create_table "move_names", primary_key: "move_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "move_names", ["move_id", "local_language_id"], name: "sqlite_autoindex_move_names_1", unique: true
  add_index "move_names", ["name"], name: "ix_move_names_name"

  create_table "move_target_prose", primary_key: "move_target_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "move_target_prose", ["move_target_id", "local_language_id"], name: "sqlite_autoindex_move_target_prose_1", unique: true
  add_index "move_target_prose", ["name"], name: "ix_move_target_prose_name"

  create_table "move_targets", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "moves", force: true do |t|
    t.string  "identifier",              limit: 79, null: false
    t.integer "generation_id",                      null: false
    t.integer "type_id",                            null: false
    t.integer "power"
    t.integer "pp"
    t.integer "accuracy"
    t.integer "priority",                           null: false
    t.integer "target_id",                          null: false
    t.integer "damage_class_id",                    null: false
    t.integer "effect_id",                          null: false
    t.integer "effect_chance"
    t.integer "contest_type_id"
    t.integer "contest_effect_id"
    t.integer "super_contest_effect_id"
  end

  create_table "nature_battle_style_preferences", primary_key: "nature_id", force: true do |t|
    t.integer "move_battle_style_id", null: false
    t.integer "low_hp_preference",    null: false
    t.integer "high_hp_preference",   null: false
  end

  add_index "nature_battle_style_preferences", ["nature_id", "move_battle_style_id"], name: "sqlite_autoindex_nature_battle_style_preferences_1", unique: true

  create_table "nature_names", primary_key: "nature_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "nature_names", ["name"], name: "ix_nature_names_name"
  add_index "nature_names", ["nature_id", "local_language_id"], name: "sqlite_autoindex_nature_names_1", unique: true

  create_table "nature_pokeathlon_stats", primary_key: "nature_id", force: true do |t|
    t.integer "pokeathlon_stat_id", null: false
    t.integer "max_change",         null: false
  end

  add_index "nature_pokeathlon_stats", ["nature_id", "pokeathlon_stat_id"], name: "sqlite_autoindex_nature_pokeathlon_stats_1", unique: true

  create_table "natures", force: true do |t|
    t.string  "identifier",        limit: 79, null: false
    t.integer "decreased_stat_id",            null: false
    t.integer "increased_stat_id",            null: false
    t.integer "hates_flavor_id",              null: false
    t.integer "likes_flavor_id",              null: false
    t.integer "game_index",                   null: false
  end

  add_index "natures", ["game_index"], name: "sqlite_autoindex_natures_1", unique: true

  create_table "pal_park", primary_key: "species_id", force: true do |t|
    t.integer "area_id",    null: false
    t.integer "base_score", null: false
    t.integer "rate",       null: false
  end

  create_table "pal_park_area_names", primary_key: "pal_park_area_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "pal_park_area_names", ["name"], name: "ix_pal_park_area_names_name"
  add_index "pal_park_area_names", ["pal_park_area_id", "local_language_id"], name: "sqlite_autoindex_pal_park_area_names_1", unique: true

  create_table "pal_park_areas", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokeathlon_stat_names", primary_key: "pokeathlon_stat_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "pokeathlon_stat_names", ["name"], name: "ix_pokeathlon_stat_names_name"
  add_index "pokeathlon_stat_names", ["pokeathlon_stat_id", "local_language_id"], name: "sqlite_autoindex_pokeathlon_stat_names_1", unique: true

  create_table "pokeathlon_stats", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokedex_prose", primary_key: "pokedex_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "pokedex_prose", ["name"], name: "ix_pokedex_prose_name"
  add_index "pokedex_prose", ["pokedex_id", "local_language_id"], name: "sqlite_autoindex_pokedex_prose_1", unique: true

  create_table "pokedex_version_groups", primary_key: "pokedex_id", force: true do |t|
    t.integer "version_group_id", null: false
  end

  add_index "pokedex_version_groups", ["pokedex_id", "version_group_id"], name: "sqlite_autoindex_pokedex_version_groups_1", unique: true

  create_table "pokedexes", force: true do |t|
    t.integer "region_id"
    t.string  "identifier",     limit: 79, null: false
    t.boolean "is_main_series",            null: false
  end

  create_table "pokemon", force: true do |t|
    t.string  "identifier",      limit: 79, null: false
    t.integer "species_id"
    t.integer "height",                     null: false
    t.integer "weight",                     null: false
    t.integer "base_experience",            null: false
    t.integer "order",                      null: false
    t.boolean "is_default",                 null: false
  end

  add_index "pokemon", ["is_default"], name: "ix_pokemon_is_default"
  add_index "pokemon", ["order"], name: "ix_pokemon_order"

  create_table "pokemon_abilities", primary_key: "pokemon_id", force: true do |t|
    t.integer "ability_id", null: false
    t.boolean "is_hidden",  null: false
    t.integer "slot",       null: false
  end

  add_index "pokemon_abilities", ["is_hidden"], name: "ix_pokemon_abilities_is_hidden"
  add_index "pokemon_abilities", ["pokemon_id", "slot"], name: "sqlite_autoindex_pokemon_abilities_1", unique: true

  create_table "pokemon_color_names", primary_key: "pokemon_color_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "pokemon_color_names", ["name"], name: "ix_pokemon_color_names_name"
  add_index "pokemon_color_names", ["pokemon_color_id", "local_language_id"], name: "sqlite_autoindex_pokemon_color_names_1", unique: true

  create_table "pokemon_colors", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_dex_numbers", primary_key: "species_id", force: true do |t|
    t.integer "pokedex_id",     null: false
    t.integer "pokedex_number", null: false
  end

  add_index "pokemon_dex_numbers", ["species_id", "pokedex_id"], name: "sqlite_autoindex_pokemon_dex_numbers_1", unique: true

  create_table "pokemon_egg_groups", primary_key: "species_id", force: true do |t|
    t.integer "egg_group_id", null: false
  end

  add_index "pokemon_egg_groups", ["species_id", "egg_group_id"], name: "sqlite_autoindex_pokemon_egg_groups_1", unique: true

  create_table "pokemon_evolution", force: true do |t|
    t.integer "evolved_species_id",                null: false
    t.integer "evolution_trigger_id",              null: false
    t.integer "trigger_item_id"
    t.integer "minimum_level"
    t.integer "gender_id"
    t.integer "location_id"
    t.integer "held_item_id"
    t.string  "time_of_day",             limit: 5
    t.integer "known_move_id"
    t.integer "known_move_type_id"
    t.integer "minimum_happiness"
    t.integer "minimum_beauty"
    t.integer "minimum_affection"
    t.integer "relative_physical_stats"
    t.integer "party_species_id"
    t.integer "party_type_id"
    t.integer "trade_species_id"
    t.boolean "needs_overworld_rain",              null: false
    t.boolean "turn_upside_down",                  null: false
  end

  create_table "pokemon_form_generations", primary_key: "pokemon_form_id", force: true do |t|
    t.integer "generation_id", null: false
    t.integer "game_index",    null: false
  end

  add_index "pokemon_form_generations", ["pokemon_form_id", "generation_id"], name: "sqlite_autoindex_pokemon_form_generations_1", unique: true

  create_table "pokemon_form_names", primary_key: "pokemon_form_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "form_name",         limit: 79
    t.string  "pokemon_name",      limit: 79
  end

  add_index "pokemon_form_names", ["form_name"], name: "ix_pokemon_form_names_form_name"
  add_index "pokemon_form_names", ["pokemon_form_id", "local_language_id"], name: "sqlite_autoindex_pokemon_form_names_1", unique: true
  add_index "pokemon_form_names", ["pokemon_name"], name: "ix_pokemon_form_names_pokemon_name"

  create_table "pokemon_form_pokeathlon_stats", primary_key: "pokemon_form_id", force: true do |t|
    t.integer "pokeathlon_stat_id", null: false
    t.integer "minimum_stat",       null: false
    t.integer "base_stat",          null: false
    t.integer "maximum_stat",       null: false
  end

  add_index "pokemon_form_pokeathlon_stats", ["pokemon_form_id", "pokeathlon_stat_id"], name: "sqlite_autoindex_pokemon_form_pokeathlon_stats_1", unique: true

  create_table "pokemon_forms", force: true do |t|
    t.string  "identifier",                     limit: 79, null: false
    t.string  "form_identifier",                limit: 79
    t.integer "pokemon_id",                                null: false
    t.integer "introduced_in_version_group_id"
    t.boolean "is_default",                                null: false
    t.boolean "is_battle_only",                            null: false
    t.boolean "is_mega",                                   null: false
    t.integer "form_order",                                null: false
    t.integer "order",                                     null: false
  end

  create_table "pokemon_game_indices", primary_key: "pokemon_id", force: true do |t|
    t.integer "version_id", null: false
    t.integer "game_index", null: false
  end

  add_index "pokemon_game_indices", ["pokemon_id", "version_id"], name: "sqlite_autoindex_pokemon_game_indices_1", unique: true

  create_table "pokemon_habitat_names", primary_key: "pokemon_habitat_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "pokemon_habitat_names", ["name"], name: "ix_pokemon_habitat_names_name"
  add_index "pokemon_habitat_names", ["pokemon_habitat_id", "local_language_id"], name: "sqlite_autoindex_pokemon_habitat_names_1", unique: true

  create_table "pokemon_habitats", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_items", primary_key: "pokemon_id", force: true do |t|
    t.integer "version_id", null: false
    t.integer "item_id",    null: false
    t.integer "rarity",     null: false
  end

  add_index "pokemon_items", ["pokemon_id", "version_id", "item_id"], name: "sqlite_autoindex_pokemon_items_1", unique: true

  create_table "pokemon_move_method_prose", primary_key: "pokemon_move_method_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "description"
  end

  add_index "pokemon_move_method_prose", ["name"], name: "ix_pokemon_move_method_prose_name"
  add_index "pokemon_move_method_prose", ["pokemon_move_method_id", "local_language_id"], name: "sqlite_autoindex_pokemon_move_method_prose_1", unique: true

  create_table "pokemon_move_methods", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_moves", primary_key: "pokemon_id", force: true do |t|
    t.integer "version_group_id",       null: false
    t.integer "move_id",                null: false
    t.integer "pokemon_move_method_id", null: false
    t.integer "level",                  null: false
    t.integer "order"
  end

  add_index "pokemon_moves", ["level"], name: "ix_pokemon_moves_level"
  add_index "pokemon_moves", ["move_id"], name: "ix_pokemon_moves_move_id"
  add_index "pokemon_moves", ["pokemon_id", "version_group_id", "move_id", "pokemon_move_method_id", "level"], name: "sqlite_autoindex_pokemon_moves_1", unique: true
  add_index "pokemon_moves", ["pokemon_id"], name: "ix_pokemon_moves_pokemon_id"
  add_index "pokemon_moves", ["pokemon_move_method_id"], name: "ix_pokemon_moves_pokemon_move_method_id"
  add_index "pokemon_moves", ["version_group_id"], name: "ix_pokemon_moves_version_group_id"

  create_table "pokemon_shape_prose", primary_key: "pokemon_shape_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.string  "awesome_name",      limit: 79
  end

  add_index "pokemon_shape_prose", ["name"], name: "ix_pokemon_shape_prose_name"
  add_index "pokemon_shape_prose", ["pokemon_shape_id", "local_language_id"], name: "sqlite_autoindex_pokemon_shape_prose_1", unique: true

  create_table "pokemon_shapes", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_species", force: true do |t|
    t.string  "identifier",              limit: 79, null: false
    t.integer "generation_id"
    t.integer "evolves_from_species_id"
    t.integer "evolution_chain_id"
    t.integer "color_id",                           null: false
    t.integer "shape_id",                           null: false
    t.integer "habitat_id"
    t.integer "gender_rate",                        null: false
    t.integer "capture_rate",                       null: false
    t.integer "base_happiness",                     null: false
    t.boolean "is_baby",                            null: false
    t.integer "hatch_counter",                      null: false
    t.boolean "has_gender_differences",             null: false
    t.integer "growth_rate_id",                     null: false
    t.boolean "forms_switchable",                   null: false
    t.integer "order",                              null: false
    t.integer "conquest_order"
  end

  add_index "pokemon_species", ["conquest_order"], name: "ix_pokemon_species_conquest_order"
  add_index "pokemon_species", ["order"], name: "ix_pokemon_species_order"

  create_table "pokemon_species_flavor_summaries", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "flavor_summary"
  end

  add_index "pokemon_species_flavor_summaries", ["pokemon_species_id", "local_language_id"], name: "sqlite_autoindex_pokemon_species_flavor_summaries_1", unique: true

  create_table "pokemon_species_flavor_text", primary_key: "species_id", force: true do |t|
    t.integer "version_id",  null: false
    t.integer "language_id", null: false
    t.text    "flavor_text", null: false
  end

  add_index "pokemon_species_flavor_text", ["species_id", "version_id", "language_id"], name: "sqlite_autoindex_pokemon_species_flavor_text_1", unique: true

  create_table "pokemon_species_names", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79
    t.text    "genus"
  end

  add_index "pokemon_species_names", ["name"], name: "ix_pokemon_species_names_name"
  add_index "pokemon_species_names", ["pokemon_species_id", "local_language_id"], name: "sqlite_autoindex_pokemon_species_names_1", unique: true

  create_table "pokemon_species_prose", primary_key: "pokemon_species_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "form_description"
  end

  add_index "pokemon_species_prose", ["pokemon_species_id", "local_language_id"], name: "sqlite_autoindex_pokemon_species_prose_1", unique: true

  create_table "pokemon_stats", primary_key: "pokemon_id", force: true do |t|
    t.integer "stat_id",   null: false
    t.integer "base_stat", null: false
    t.integer "effort",    null: false
  end

  add_index "pokemon_stats", ["pokemon_id", "stat_id"], name: "sqlite_autoindex_pokemon_stats_1", unique: true

  create_table "pokemon_types", primary_key: "pokemon_id", force: true do |t|
    t.integer "type_id", null: false
    t.integer "slot",    null: false
  end

  add_index "pokemon_types", ["pokemon_id", "slot"], name: "sqlite_autoindex_pokemon_types_1", unique: true

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
    t.string   "comment"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "region_names", primary_key: "region_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "region_names", ["name"], name: "ix_region_names_name"
  add_index "region_names", ["region_id", "local_language_id"], name: "sqlite_autoindex_region_names_1", unique: true

  create_table "regions", force: true do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "stat_names", primary_key: "stat_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "stat_names", ["name"], name: "ix_stat_names_name"
  add_index "stat_names", ["stat_id", "local_language_id"], name: "sqlite_autoindex_stat_names_1", unique: true

  create_table "stats", force: true do |t|
    t.integer "damage_class_id"
    t.string  "identifier",      limit: 79, null: false
    t.boolean "is_battle_only",             null: false
    t.integer "game_index"
  end

  create_table "super_contest_combos", primary_key: "first_move_id", force: true do |t|
    t.integer "second_move_id", null: false
  end

  add_index "super_contest_combos", ["first_move_id", "second_move_id"], name: "sqlite_autoindex_super_contest_combos_1", unique: true

  create_table "super_contest_effect_prose", primary_key: "super_contest_effect_id", force: true do |t|
    t.integer "local_language_id", null: false
    t.text    "flavor_text",       null: false
  end

  add_index "super_contest_effect_prose", ["super_contest_effect_id", "local_language_id"], name: "sqlite_autoindex_super_contest_effect_prose_1", unique: true

  create_table "super_contest_effects", force: true do |t|
    t.integer "appeal", null: false
  end

  create_table "type_efficacy", primary_key: "damage_type_id", force: true do |t|
    t.integer "target_type_id", null: false
    t.integer "damage_factor",  null: false
  end

  add_index "type_efficacy", ["damage_type_id", "target_type_id"], name: "sqlite_autoindex_type_efficacy_1", unique: true

  create_table "type_game_indices", primary_key: "type_id", force: true do |t|
    t.integer "generation_id", null: false
    t.integer "game_index",    null: false
  end

  add_index "type_game_indices", ["type_id", "generation_id"], name: "sqlite_autoindex_type_game_indices_1", unique: true

  create_table "type_names", primary_key: "type_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "type_names", ["name"], name: "ix_type_names_name"
  add_index "type_names", ["type_id", "local_language_id"], name: "sqlite_autoindex_type_names_1", unique: true

  create_table "types", force: true do |t|
    t.string  "identifier",      limit: 79, null: false
    t.integer "generation_id",              null: false
    t.integer "damage_class_id"
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
  end

  create_table "version_group_pokemon_move_methods", primary_key: "version_group_id", force: true do |t|
    t.integer "pokemon_move_method_id", null: false
  end

  add_index "version_group_pokemon_move_methods", ["version_group_id", "pokemon_move_method_id"], name: "sqlite_autoindex_version_group_pokemon_move_methods_1", unique: true

  create_table "version_group_regions", primary_key: "version_group_id", force: true do |t|
    t.integer "region_id", null: false
  end

  add_index "version_group_regions", ["version_group_id", "region_id"], name: "sqlite_autoindex_version_group_regions_1", unique: true

  create_table "version_groups", force: true do |t|
    t.string  "identifier",    limit: 79, null: false
    t.integer "generation_id",            null: false
    t.integer "order"
  end

  add_index "version_groups", ["identifier"], name: "sqlite_autoindex_version_groups_1", unique: true

  create_table "version_names", primary_key: "version_id", force: true do |t|
    t.integer "local_language_id",            null: false
    t.string  "name",              limit: 79, null: false
  end

  add_index "version_names", ["name"], name: "ix_version_names_name"
  add_index "version_names", ["version_id", "local_language_id"], name: "sqlite_autoindex_version_names_1", unique: true

  create_table "versions", force: true do |t|
    t.integer "version_group_id",            null: false
    t.string  "identifier",       limit: 79, null: false
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

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
