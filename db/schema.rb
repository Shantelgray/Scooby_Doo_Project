ActiveRecord::Schema.define(version: 20_250_805_145_036) do
  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "disguise_as"
    t.integer "mystery_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mystery_id"], name: "index_monsters_on_mystery_id"
  end

  create_table "mysteries", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.datetime "date_reported"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "monsters", "mysteries"
end
