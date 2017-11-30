json.extract! user_account, :id, :goal, :account_id, :annual_income, :fin_assets, :non_fin_assets, :created_at, :updated_at
json.url user_account_url(user_account, format: :json)
