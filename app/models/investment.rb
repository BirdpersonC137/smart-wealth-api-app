class Investment < ApplicationRecord
    def self.search(search)
        if search
          where('objective ILIKE ? OR risk_category ILIKE ? OR name ILIKE ? OR style ILIKE? OR distribution ILIKE?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order('id DESC')
        else
          order('id DESC') 
        end
    end
end

#FOR CSV UPLOAD FOR NOW - use this in PG admin
#COPY investments(ticker, name, price, yield, mer, risk_category, objective, distribution, style,typeof, created_at, updated_at) FROM '/Users/Birdperson/Desktop/smart-wealth/investmentcsv.csv' DELIMITER ',' HEADER CSV

