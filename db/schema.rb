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

ActiveRecord::Schema.define(version: 20171204221027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "account_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "investment_portfolios", force: :cascade do |t|
    t.bigint "investment_id"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["investment_id"], name: "index_investment_portfolios_on_investment_id"
    t.index ["portfolio_id"], name: "index_investment_portfolios_on_portfolio_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.float "price"
    t.float "yield"
    t.float "mer"
    t.string "risk_category"
    t.string "objective"
    t.string "distribution"
    t.string "style"
    t.string "typeof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_strategies", force: :cascade do |t|
    t.bigint "portfolio_id"
    t.bigint "strategy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_strategies_on_portfolio_id"
    t.index ["strategy_id"], name: "index_portfolio_strategies_on_strategy_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cad_equity"
    t.float "us_equity"
    t.float "int_equity"
    t.float "emerging_equity"
    t.float "alternatives"
    t.float "cad_fixed_income"
    t.float "int_fixed_income"
    t.float "cash"
  end

  create_table "risk_assessments", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_answers", force: :cascade do |t|
    t.bigint "survey_question_id"
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_question_id"], name: "index_survey_answers_on_survey_question_id"
    t.index ["user_id"], name: "index_survey_answers_on_user_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.string "title"
    t.bigint "risk_assessment_id"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["risk_assessment_id"], name: "index_survey_questions_on_risk_assessment_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string "goal"
    t.float "financial_goal"
    t.bigint "account_id"
    t.float "annual_income"
    t.float "fin_assets"
    t.float "non_fin_assets"
    t.float "liabilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "inc_stability"
    t.float "withdrawals"
    t.float "time_horizon"
    t.float "age_factor"
    t.bigint "strategy_id"
    t.bigint "portfolio_id"
    t.index ["account_id"], name: "index_user_accounts_on_account_id"
    t.index ["portfolio_id"], name: "index_user_accounts_on_portfolio_id"
    t.index ["strategy_id"], name: "index_user_accounts_on_strategy_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "user_dashboards", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_dashboards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "risk_profile"
    t.string "ability_to_assume_risk"
    t.string "strategy"
    t.decimal "IPQ"
    t.integer "age"
    t.string "inv_objective"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "accounts", "account_types"
  add_foreign_key "investment_portfolios", "investments"
  add_foreign_key "investment_portfolios", "portfolios"
  add_foreign_key "portfolio_strategies", "portfolios"
  add_foreign_key "portfolio_strategies", "strategies"
  add_foreign_key "survey_answers", "survey_questions"
  add_foreign_key "survey_answers", "users"
  add_foreign_key "survey_questions", "risk_assessments"
  add_foreign_key "user_accounts", "accounts"
  add_foreign_key "user_accounts", "portfolios"
  add_foreign_key "user_accounts", "strategies"
  add_foreign_key "user_accounts", "users"
  add_foreign_key "user_dashboards", "users"
end
