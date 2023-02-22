ActiveRecord::Schema.define(version: 2023_02_15_155128) do

  enable_extension "plpgsql"

  create_table "nearest_stations", force: :cascade do |t|
    t.string "line"
    t.string "station"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_nearest_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "rent"
    t.string "address"
    t.string "age"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "nearest_stations", "properties"
end
