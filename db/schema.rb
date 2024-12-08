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

ActiveRecord::Schema[8.0].define(version: 2024_12_08_111019) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "articles", force: :cascade do |t|
    t.bigint "publisher_id", null: false
    t.text "title"
    t.string "article_link"
    t.string "image_link"
    t.bigint "language_id", null: false
    t.bigint "category_id", null: false
    t.string "guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_date"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["language_id"], name: "index_articles_on_language_id"
    t.index ["publisher_id", "guid"], name: "index_articles_on_publisher_id_and_guid", unique: true
    t.index ["publisher_id"], name: "index_articles_on_publisher_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id"
    t.index ["language_id"], name: "index_categories_on_language_id"
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "rss_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id"
    t.bigint "category_id"
    t.boolean "bilingual?"
    t.boolean "one_category?"
    t.index ["category_id"], name: "index_publishers_on_category_id"
    t.index ["language_id"], name: "index_publishers_on_language_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "languages"
  add_foreign_key "articles", "publishers"
  add_foreign_key "categories", "languages"
  add_foreign_key "publishers", "categories"
  add_foreign_key "publishers", "languages"
end
