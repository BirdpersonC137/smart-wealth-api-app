class UserAccountSerializer < ActiveModel::Serializer
  attributes :id, :goal, :annual_income, :fin_assets, :non_fin_assets
  has_one :account
end
