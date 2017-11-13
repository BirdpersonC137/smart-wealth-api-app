class InvestmentSerializer < ActiveModel::Serializer
  attributes :id, :ticker, :name, :price, :yield, :MER, :risk_category, :objective, :distribution, :style
end
