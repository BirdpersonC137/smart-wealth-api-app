class Portfolio < ApplicationRecord
    has_many :investment_portfolios, dependent: :nullify
    has_many :investments, through: :investment_portfolios
    belongs_to :strategy
    has_many :user_accounts, dependent: :destroy
    validate :over_100
    validates_numericality_of :cad_equity, :us_equity, :int_equity, :emerging_equity, :alternatives, :cad_fixed_income, :int_fixed_income, :cash
    validates_presence_of :cad_equity, :us_equity, :int_equity, :emerging_equity, :alternatives, :cad_fixed_income, :int_fixed_income, :cash
    
    validates(:name,{
        uniqueness: true
    })
    private
    def over_100
      if cad_equity + us_equity + int_equity + emerging_equity + alternatives + cad_fixed_income + int_fixed_income + cash  > 100
        errors.add(:name, "Sum cannot be more than 100%, you entered #{cad_equity + us_equity + int_equity + emerging_equity + alternatives + cad_fixed_income + int_fixed_income + cash}% ")
      elsif cad_equity + us_equity + int_equity + emerging_equity + alternatives + cad_fixed_income + int_fixed_income + cash < 100
        errors.add(:name, "Sum has to be 100%, you entered #{cad_equity + us_equity + int_equity + emerging_equity + alternatives + cad_fixed_income + int_fixed_income + cash}%")
      end
    end
end
