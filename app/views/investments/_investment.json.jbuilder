json.extract! investment, :id, :ticker, :name, :price, :yield, :MER, :risk_category, :objective, :distribution, :style, :created_at, :updated_at
json.url investment_url(investment, format: :json)
