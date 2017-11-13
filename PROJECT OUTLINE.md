#PROJECT OUTLINE

#==================APP===================
Users
#----------------------------------------
1. Investors - Permissions - If accounts -> is_investor = true
2. Readers/Visitors - Permissions - If !accounts -> is_investor = false
has_one :risk_profile
has_one :portfolio, through: :risk_profile
has_man :investments, through: :portfolio

#----------------------------------------
Accounts
#----------------------------------------
RRSP - has many investments 
- belongs to accounts
- belongs to user is_investor through accounts
TFSA - has many investments 
- belongs to accounts
- belongs to user is_investor through accounts

#----------------------------------------
Risk profiles
#----------------------------------------
1. Low risk
- Belongs to user
- Has many investments
- Has many portfolios
2. Moderate Low
- Belongs to user
- Has many investments
- Has many portfolios
3. Moderate
4. Moderate High
- Belongs to user
- Has many investments
- Has many portfolios
5. High
- Belongs to user
- Has many investments
- Has many portfolios
6. Aggressively High
- Belongs to user
- Has many investments
- Has many portfolios
#----------------------------------------
Portfolios
#----------------------------------------
1. Portfolio#1 has many investment types belongs to risk profiles
2. Portfolio#2 has many investment types belongs to risk profiles
#----------------------------------------
#Investments
#----------------------------------------
1. Investment Type-1 belongs to portfolio 
2. Investment Type-2 belongs to portfolio
3. Investment Type-3 belongs to portfolio
+++++Ticker - belongs to investment
#--etc
