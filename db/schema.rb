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

ActiveRecord::Schema[7.0].define(version: 2023_11_29_001514) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Comment", primary_key: "UserId", id: :bigint, default: -> { "nextval('\"Comment_id_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "PostId"
    t.index ["PostId"], name: "index_Comment_on_PostId", unique: true
    t.index ["UserId"], name: "index_Comment_on_UserId", unique: true
  end

  create_table "Like", primary_key: "UserId", id: :bigint, default: -> { "nextval('\"Like_id_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "PostId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["PostId"], name: "index_Like_on_PostId", unique: true
    t.index ["UserId"], name: "index_Like_on_UserId", unique: true
  end

  create_table "Post", primary_key: "AuthorId", id: :bigint, default: -> { "nextval('\"Post_id_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "Title"
    t.string "Text"
    t.integer "CommentsCounter"
    t.integer "LikesCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["AuthorId"], name: "index_Post_on_AuthorId", unique: true
  end

  create_table "User", force: :cascade do |t|
    t.string "Name"
    t.string "Photo"
    t.string "Bio"
    t.integer "PostsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "Comment", "User", column: "UserId"
end
