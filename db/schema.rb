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

ActiveRecord::Schema.define(version: 20170614141006) do

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "slug"
    t.string "state"
    t.string "title"
    t.string "description"
    t.string "story"
    t.date "end_on"
    t.datetime "launched_at"
    t.decimal "goal", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "campaign_id"
    t.decimal "total_amount", precision: 6, scale: 2, default: "0.0"
    t.decimal "donation_amount", precision: 6, scale: 2, default: "0.0"
    t.decimal "organizer_amount", precision: 6, scale: 2, default: "0.0"
    t.decimal "website_amount", precision: 6, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_donations_on_campaign_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "donation_id"
    t.string "gateway_ref"
    t.string "state"
    t.decimal "amount", precision: 6, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id"], name: "index_payments_on_donation_id"
  end

  add_foreign_key "donations", "campaigns"
  add_foreign_key "payments", "donations"
end
