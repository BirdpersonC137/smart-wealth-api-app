class Investment < ApplicationRecord
end

#FOR CSV UPLOAD FOR NOW - use this in PG admin
#COPY investments(ticker, name, price, yield, MER, risk_category, objective, distribution, style, created_at, updated_at) FROM '/Users/Birdperson/Desktop/smart-wealth/investments.csv' DELIMITER ',' HEADER CSV