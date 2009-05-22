# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "subscription_profiles", :force => true do |t|
    t.integer  "subscription_id",              :null => false
    t.integer  "recurring_payment_profile_id", :null => false
    t.datetime "created_at",                   :null => false
  end

  add_index "subscription_profiles", ["subscription_id"], :name => "ix_subscription_profiles_subscription"

  create_table "subscriptions", :force => true do |t|
    t.string   "account_id",     :null => false
    t.string   "tariff_plan_id", :null => false
    t.string   "taxes_id",       :null => false
    t.integer  "quantity",       :null => false
    t.string   "currency",       :null => false
    t.integer  "net_amount",     :null => false
    t.integer  "taxes_amount",   :null => false
    t.string   "periodicity",    :null => false
    t.date     "starts_on",      :null => false
    t.date     "ends_on"
    t.string   "status",         :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "subscriptions", ["account_id"], :name => "ix_subscription_account"

  create_table "tracker_recurring_payment_profiles", :force => true do |t|
    t.string   "gateway_reference"
    t.string   "gateway"
    t.text     "subscription_name"
    t.text     "description"
    t.string   "currency"
    t.integer  "net_amount",                              :null => false
    t.integer  "taxes_amount",                            :null => false
    t.integer  "outstanding_balance"
    t.integer  "total_payments_count"
    t.integer  "complete_payments_count"
    t.integer  "failed_payments_count"
    t.integer  "remaining_payments_count"
    t.string   "periodicity"
    t.integer  "trial_days",               :default => 0
    t.integer  "pay_on_day_x",             :default => 0
    t.string   "status"
    t.string   "problem_status"
    t.string   "card_type"
    t.string   "card_owner_memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.datetime "last_synchronized_at"
  end

  add_index "tracker_recurring_payment_profiles", ["gateway"], :name => "ix_tracker_recurring_payment_profiles_gateway"
  add_index "tracker_recurring_payment_profiles", ["gateway_reference"], :name => "uix_tracker_recurring_payment_profiles_gateway_reference", :unique => true

  create_table "tracker_transactions", :force => true do |t|
    t.integer  "recurring_payment_profile_id"
    t.string   "gateway_reference"
    t.string   "currency"
    t.integer  "amount"
    t.string   "result_code"
    t.string   "result_text"
    t.string   "card_type"
    t.string   "card_owner_memo"
    t.datetime "created_at"
    t.datetime "recorded_at"
  end

  add_index "tracker_transactions", ["recurring_payment_profile_id"], :name => "index_tracker_transactions_on_recurring_payment_profile_id"

end
