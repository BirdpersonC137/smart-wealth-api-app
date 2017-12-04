class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_accounts, dependent: :destroy
  has_many :accounts
  delegate :user_account, to: :user
  has_many :strategies, through: :user_accounts
  before_save :assign_age
  has_one :user_dashboard
  private
    def assign_age
      @now = Time.now.utc.to_date
      self.age = @now.year - self.date_of_birth.to_date.year - ((@now.month > self.date_of_birth.to_date.month || (@now.month == self.date_of_birth.to_date.month && @now.day >= self.date_of_birth.to_date.day)) ? 0 : 1)
    end
end
