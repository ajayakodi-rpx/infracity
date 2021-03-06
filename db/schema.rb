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

ActiveRecord::Schema.define(version: 20161216153114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_districts_on_name", using: :btree
    t.index ["state_id"], name: "index_districts_on_state_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "contact_number1"
    t.string   "contact_number2"
    t.text     "address1"
    t.text     "address2"
    t.string   "profile_image_path"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["email"], name: "index_profiles_on_email", unique: true, using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "role_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_default"
    t.string   "users_roles_map_type"
    t.integer  "users_roles_map_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["name"], name: "index_role_types_on_name", using: :btree
    t.index ["users_roles_map_type", "users_roles_map_id"], name: "index_role_types_on_users_roles_map_type_and_users_roles_map_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
    t.index ["name"], name: "index_states_on_name", using: :btree
  end

  create_table "taluks", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_taluks_on_district_id", using: :btree
    t.index ["name"], name: "index_taluks_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.string   "users_roles_map_type"
    t.integer  "users_roles_map_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "encrypted_password",   limit: 128
    t.string   "confirmation_token",   limit: 128
    t.string   "remember_token",       limit: 128
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
    t.index ["users_roles_map_type", "users_roles_map_id"], name: "index_users_on_users_roles_map_type_and_users_roles_map_id", using: :btree
  end

  create_table "users_roles_maps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["role_type_id"], name: "index_users_roles_maps_on_role_type_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_maps_on_user_id", using: :btree
  end

  create_table "wards", force: :cascade do |t|
    t.string   "name"
    t.integer  "ward_number"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "zone_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_wards_on_name", using: :btree
    t.index ["ward_number"], name: "index_wards_on_ward_number", using: :btree
    t.index ["zone_id"], name: "index_wards_on_zone_id", using: :btree
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "zone_number"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "taluk_id"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_zones_on_district_id", using: :btree
    t.index ["name"], name: "index_zones_on_name", using: :btree
    t.index ["taluk_id"], name: "index_zones_on_taluk_id", using: :btree
    t.index ["zone_number"], name: "index_zones_on_zone_number", using: :btree
  end

  add_foreign_key "districts", "states"
  add_foreign_key "profiles", "users"
  add_foreign_key "states", "countries"
  add_foreign_key "taluks", "districts"
  add_foreign_key "users_roles_maps", "role_types"
  add_foreign_key "users_roles_maps", "users"
  add_foreign_key "wards", "zones"
  add_foreign_key "zones", "districts"
  add_foreign_key "zones", "taluks"
end
