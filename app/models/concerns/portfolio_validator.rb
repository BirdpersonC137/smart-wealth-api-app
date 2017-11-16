class PortfolioValidator < ActiveModel::Validator
    def validate_each(record, attribute, value)
        if 100 < [record.cad_equity, record.us_equity, record.int_equity]
            record.errors.add(:portfolio, "can't exceed 100%")
        end
    end
end