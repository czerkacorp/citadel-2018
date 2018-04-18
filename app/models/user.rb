class User < ActiveRecord::Base
  self.table_name = "citadel_users"
  validates :name, uniqueness: true
  has_one :account

  def get_account
    Account.find(account_id)
  end
end
