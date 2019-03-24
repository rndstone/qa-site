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

ActiveRecord::Schema.define(version: 20190324070248) do

  create_table "answer_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_likes_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_answer_likes_on_user_id_and_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answer_likes_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "is_best_answer", default: 0, null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currency_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "amount",        precision: 14, scale: 5, default: "0.0"
    t.integer  "user_id"
    t.integer  "currency_type"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["user_id"], name: "index_funds_on_user_id", using: :btree
  end

  create_table "question_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_likes_on_question_id", using: :btree
    t.index ["user_id", "question_id"], name: "index_question_likes_on_user_id_and_question_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_question_likes_on_user_id", using: :btree
  end

  create_table "questioner_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "answer_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_questioner_responses_on_answer_id", unique: true, using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.integer  "is_open",     default: 1, null: false
    t.index ["category_id"], name: "index_questions_on_category_id", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "transfer_tos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "transfer_id"
    t.integer  "to_user"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["transfer_id"], name: "index_transfer_tos_on_transfer_id", using: :btree
  end

  create_table "transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.decimal  "amount",           precision: 14, scale: 5
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "currency_type_id"
    t.integer  "tradetype"
    t.index ["currency_type_id"], name: "index_transfers_on_currency_type_id", using: :btree
    t.index ["user_id"], name: "index_transfers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image_name",      default: "default.jpg"
  end

  add_foreign_key "answer_likes", "answers"
  add_foreign_key "answer_likes", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "funds", "users"
  add_foreign_key "question_likes", "questions"
  add_foreign_key "question_likes", "users"
  add_foreign_key "questioner_responses", "answers"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "users"
  add_foreign_key "transfer_tos", "transfers"
  add_foreign_key "transfers", "currency_types"
  add_foreign_key "transfers", "users"
end
