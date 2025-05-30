# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_13_060844) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "examples", force: :cascade do |t|
    t.bigint "unknown_word_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unknown_word_id"], name: "index_examples_on_unknown_word_id"
  end

  create_table "meanings", force: :cascade do |t|
    t.bigint "unknown_word_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unknown_word_id"], name: "index_meanings_on_unknown_word_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unknown_words", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content", null: false
    t.index ["content"], name: "index_unknown_words_on_content", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.bigint "sentence_id", null: false
    t.text "content", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sentence_id"], name: "index_words_on_sentence_id"
  end

  add_foreign_key "examples", "unknown_words"
  add_foreign_key "meanings", "unknown_words"
  add_foreign_key "words", "sentences"
end
