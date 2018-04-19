require 'securerandom'
require 'digest'

class User < ActiveRecord::Base
  self.table_name = "citadel_users"
  validates :name, uniqueness: true
  has_one :account

  def self.register(user)
    num_generator = Random.new
    salt = SecureRandom.hex(10)
    pass_hash = Digest::SHA256.hexdigest(Setting['db_secret'] + user[:password] + salt)
    station_id = num_generator.rand(4294967295)
    new_user = User.create(name: user[:username], password: pass_hash, email: user[:email])
    account = Account.create(
      username: user[:username], 
      password: pass_hash, 
      salt: salt, 
      station_id: station_id
      )
    Account.transaction do
      account.save!
      new_user.account_id = account.account_id
      new_user.save!
    end
    return new_user
  end


  def get_account
    Account.find(account_id)
  end
end
