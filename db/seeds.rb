require "csv"
Investment.destroy_all

CSV.foreach(Rails.root.join('investmentcsv.csv'), headers: true) do |row|
    p row  
  Investment.create! do |investment|
  investment.ticker = row[0]
  investment.name = row['name']
  investment.price = row['price']
  investment.yield = row['yield']
  investment.mer = row['mer']
  investment.risk_category = row['risk_category']
  investment.objective = row['objective']
  investment.distribution = row['distribution']
  investment.style = row['style']
  investment.typeof = row['typeof']
  puts "#{investment.price}, #{investment.name} saved"
  end
end

puts "There are now #{Investment.count} rows in the transactions table"

# params(
# :ticker, 
# :name, 
# :price, 
# :yield, 
# :mer, 
# :risk_category, 
# :objective, 
# :distribution, 
# :style, 
# :typeof)
