require "csv"
Investment.destroy_all
Portfolio.destroy_all

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
Portfolio.create(name: 'Preservation of Capital Large', cad_equity: 7.5, us_equity: 11.5, int_equity: 14.0, emerging_equity: 0, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 40, cash: 2)
Portfolio.create(name: 'Conservative Growth Large', cad_equity: 12.5, us_equity: 14.5, int_equity: 13.5, emerging_equity: 5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 28, cash: 1.5)
Portfolio.create(name: 'Balanced Large', cad_equity: 16.00, us_equity: 15.00, int_equity: 17, emerging_equity: 7.5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 18, cash: 1.5)
Portfolio.create(name: 'Growth Large', cad_equity: 18, us_equity: 19, int_equity: 21.5, emerging_equity: 7, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 8, cash: 6.5)
Portfolio.create(name: 'Aggressive Growth Large', cad_equity: 19.0, us_equity: 22.5, int_equity: 22.0, emerging_equity: 8, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 2.5, cash: 6.00)
Portfolio.create(name: 'Alpha Large', cad_equity: 20.5, us_equity: 19.5, int_equity: 24.0, emerging_equity: 10, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 0, cash: 6)
Portfolio.create(name: 'Corporate Model', cad_equity: 18, us_equity: 16, int_equity: 21.5, emerging_equity: 7.5, alternatives: 25.0, cad_fixed_income: 10, int_fixed_income: 0, cash: 2)
Portfolio.create(name: 'Income Large', cad_equity: 15, us_equity: 25, int_equity: 18.5, emerging_equity: 0, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 15, cash: 1.5)
Portfolio.create(name: 'Preservation of Capital Small & TFSA', cad_equity: 7.5, us_equity: 11.5, int_equity: 14.0, emerging_equity: 0, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 40, cash: 2)
Portfolio.create(name: 'Conservative Growth Small & TFSA',cad_equity: 12.5, us_equity: 14.5, int_equity: 13.5, emerging_equity: 5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 28, cash: 1.5)
Portfolio.create(name: 'Balanced Small', cad_equity: 15, us_equity: 16.5, int_equity: 16.0, emerging_equity: 7.5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 18, cash: 2)
Portfolio.create(name: 'Growth Small', cad_equity: 18, us_equity: 19, int_equity: 21.5, emerging_equity: 7, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 8, cash: 6.5)
Portfolio.create(name: 'Aggressive Growth Small', cad_equity: 19, us_equity: 22.5, int_equity: 20.5, emerging_equity: 8.5, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 2.5, cash: 7)
Portfolio.create(name: 'Alpha Small & TFSA', cad_equity: 20.5, us_equity: 19.00, int_equity: 24.5, emerging_equity: 10.0, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 0, cash: 6)
Portfolio.create(name: 'Income Small', cad_equity: 15, us_equity: 25, int_equity: 18.5, emerging_equity: 0, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 15, cash: 1.5)
Portfolio.create(name: 'PFIC - Conservative Growth', cad_equity: 10.0, us_equity: 18.5, int_equity: 14, emerging_equity: 5, alternatives: 17.5, cad_fixed_income: 0, int_fixed_income: 33, cash: 2)
Portfolio.create(name: 'PFIC - Balanced', cad_equity: 10, us_equity: 19.5, int_equity: 19.0, emerging_equity: 7.5, alternatives: 17.5, cad_fixed_income: 0, int_fixed_income: 25, cash: 1.5)
Portfolio.create(name: 'Ethical', cad_equity: 10, us_equity: 5, int_equity: 30, emerging_equity: 0, alternatives: 25, cad_fixed_income: 0, int_fixed_income: 28, cash: 2)


portfolios = Portfolio.all

puts "#{Portfolio.count} portfolios was created"
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
