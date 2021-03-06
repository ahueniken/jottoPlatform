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

ActiveRecord::Schema.define(:version => 20131115053734) do

  create_table "games", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user1"
    t.integer  "user2"
    t.string   "word1"
    t.string   "word2"
    t.integer  "winner"
    t.text     "p1GuessResults"
    t.text     "p2GuessResults"
    t.string   "p1guesses"
    t.string   "p2guesses"
  end

  create_table "games_users", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  add_index "games_users", ["game_id", "user_id"], :name => "index_games_users_on_game_id_and_user_id"
  add_index "games_users", ["user_id"], :name => "index_games_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.integer  "elo"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
