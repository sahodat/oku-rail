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

ActiveRecord::Schema.define(version: 2018_11_29_033926) do

  create_table "opdt_jobans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "o_id"
    t.string "o_type"
    t.datetime "date"
    t.string "context"
    t.datetime "o_valid"
    t.integer "delay"
    t.integer "opdt_index"
    t.string "same_as"
    t.string "railway"
    t.string "operator"
    t.string "to_station"
    t.string "train_type"
    t.string "from_station"
    t.string "train_number"
    t.string "direction"
    t.integer "composition"
    t.string "destinantion_station"
  end

  create_table "opdt_yamanotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "o_id"
    t.string "o_type"
    t.datetime "date"
    t.string "context"
    t.datetime "o_valid"
    t.integer "delay"
    t.integer "opdt_index"
    t.string "same_as"
    t.string "railway"
    t.string "operator"
    t.string "to_station"
    t.string "train_type"
    t.string "from_station"
    t.string "train_number"
    t.string "direction"
    t.integer "composition"
    t.string "destinantion_station"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
