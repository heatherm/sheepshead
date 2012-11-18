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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121118081037) do

  create_table "buries", :force => true do |t|
    t.integer  "card_one_id"
    t.integer  "card_two_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cards", :force => true do |t|
    t.string  "suit"
    t.string  "rank"
    t.integer "value"
    t.boolean "trump"
    t.integer "trump_rank"
  end

  create_table "game_players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "picker"
    t.boolean  "partner"
  end

  create_table "games", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hands", :force => true do |t|
    t.integer  "game_player_id"
    t.integer  "card_one_id"
    t.integer  "card_two_id"
    t.integer  "card_three_id"
    t.integer  "card_four_id"
    t.integer  "card_five_id"
    t.integer  "card_six_id"
    t.integer  "trick_id"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

  create_table "plays", :force => true do |t|
    t.integer  "trick_id"
    t.integer  "game_player_id"
    t.integer  "card_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tricks", :force => true do |t|
    t.integer  "game_id"
    t.integer  "winner_id"
    t.integer  "play_one"
    t.integer  "play_two"
    t.integer  "play_three"
    t.integer  "play_four"
    t.integer  "play_five"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
