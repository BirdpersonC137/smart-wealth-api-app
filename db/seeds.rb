require "csv"
Investment.destroy_all
Portfolio.destroy_all
Account.destroy_all
Strategy.destroy_all
AdminUser.destroy_all

CSV.foreach(Rails.root.join('investmentcsv.csv'), headers: true) do |row|
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

Strategy.create(name: 'Preservation of Capital')
Strategy.create(name: 'Conservative Growth')
Strategy.create(name: 'Balanced')
Strategy.create(name: 'Growth')
Strategy.create(name: 'Aggressive Growth')

Portfolio.create(name: 'Preservation of Capital Large', cad_equity: 7.5, us_equity: 11.5, int_equity: 14.0, emerging_equity: 0, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 40, cash: 2, strategy: Strategy.find_by_name('Preservation of Capital'))
Portfolio.create(name: 'Conservative Growth Large', cad_equity: 12.5, us_equity: 14.5, int_equity: 13.5, emerging_equity: 5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 28, cash: 1.5, strategy: Strategy.find_by_name('Preservation of Capital'))
Portfolio.create(name: 'Balanced Large', cad_equity: 16.00, us_equity: 15.00, int_equity: 17, emerging_equity: 7.5, alternatives: 25.0, cad_fixed_income: 0, int_fixed_income: 18, cash: 1.5, strategy: Strategy.find_by_name('Balanced'))
Portfolio.create(name: 'Growth Large', cad_equity: 18, us_equity: 19, int_equity: 21.5, emerging_equity: 7, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 8, cash: 6.5,strategy: Strategy.find_by_name('Growth'))
Portfolio.create(name: 'Aggressive Growth Large', cad_equity: 19.0, us_equity: 22.5, int_equity: 22.0, emerging_equity: 8, alternatives: 20.0, cad_fixed_income: 0, int_fixed_income: 2.5, cash: 6.00,strategy: Strategy.find_by_name('Aggressive Growth'))

Account.create(name: 'TFSA')
Account.create(name: 'Individual')
Account.create(name: 'Joint - Right of Survivorship')
Account.create(name: 'Individual RRSP')
Account.create(name: 'Spousal RRSP')
Account.create(name: 'Individual RRIF')
Account.create(name: 'Spousal RRIF')
Account.create(name: 'Individual RESP')
Account.create(name: 'Family RESP')
Account.create(name: 'LIRA - Locked-in Retirement Account')


strategies = Strategy.all
accounts = Account.all
portfolios = Portfolio.all

puts "#{Portfolio.count} portfolios was created"
puts "There are now #{Investment.count} rows in the transactions table"
puts "#{accounts.count} accounts were created"
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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?