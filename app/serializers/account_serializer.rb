class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :account_type
end
